//
//  ResultWinnerView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 29/07/21.
//

import SwiftUI

struct ResultWinnerView: View {
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    
    @State var rect: CGSize = .zero
    
    @State var generatedImage = UIImage(named: "Group 3")
    
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                
                if (horizontalSize == .regular || verticalSize == .regular) {
                    
                    ZStack() {
                        
                        Image("BgPrimeiroLugar")
                            .resizable()
                        
                        VStack{
                            Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(
                                    minWidth: 50,
                                    idealWidth: 100,
                                    maxWidth: 150,
                                    minHeight: 50,
                                    idealHeight: 100,
                                    maxHeight: 150,
                                    alignment: .center)
                            
                            Text(player.displayName.uppercased())
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        } .padding(.top)
                    } .frame(width: 600, height: 370)
                    
                    
                } else {
                    
                    ZStack{
                        
                        Image("BgPrimeiroLugar")
                            .resizable()
                        
                        VStack{
                            Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text(player.displayName.uppercased())
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        } .padding(.top)
                    } .frame(width: 400, height: 240)
                }
            } .onAppear() {
                makeView(geometry)
                convertViewToData(view: self.body, size: rect) {
                    guard let imageData = $0 else { return }
                    generatedImage = UIImage(data: imageData)
                    
                }
            }
            .onDrag { NSItemProvider(object: generatedImage! as UIImage)}
            
        } .frame(width: 600, height: 370, alignment: .center)
    }
    
    func makeView(_ geometry: GeometryProxy){
        
        DispatchQueue.main.async { self.rect = geometry.size }
        
        rect = geometry.size
        
    }
}



func convertViewToData<V>(view: V, size: CGSize, completion: @escaping (Data?) -> Void) where V: View {
    guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
        completion(nil)
        return
    }
    let imageVC = UIHostingController(rootView: view.edgesIgnoringSafeArea(.all))
    imageVC.view.frame = CGRect(origin: .zero, size: size)
    DispatchQueue.main.async {
        rootVC.view.insertSubview(imageVC.view, at: 0)
        let uiImage = imageVC.view.asImage(size: size)
        imageVC.view.removeFromSuperview()
        completion(uiImage.pngData())
    }
}
