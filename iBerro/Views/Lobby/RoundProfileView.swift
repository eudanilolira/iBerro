//
//  RoundProfileView.swift
//  iBerro
//
//  Created by Danilo Araújo on 21/07/21.
//

import SwiftUI

struct RoundProfileView: View {
    @State var profile: ImageWrapper
    @State var name: String
    
    var body: some View {
        Image(uiImage: UIImage(data: profile.image)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(
                minWidth: 50,
                idealWidth: 80,
                maxWidth: 100,
                minHeight: 50,
                idealHeight: 80,
                maxHeight: 100,
                alignment: .bottom)
        
        Text(name)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .padding([.leading,.trailing])

    }
}

//struct RoundProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundProfileView()
//    }
//}
