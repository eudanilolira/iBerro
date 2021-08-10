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
    @State var isDragging = false
    
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
                                .font(Font.custom("Pexico", size: 40))
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
                                .font(Font.custom("Pexico", size: 24))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        } .padding(.top)
                    } .frame(width: 400, height: 240)
                }
            }
            .onDrag {
                let item = self.snapshot()
                let provider = NSItemProvider(object: item)
                return provider
            }
            
        } .frame(width: 600, height: 370, alignment: .center)
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
