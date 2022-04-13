//
//  ProductListView.swift
//  not_ikea
//
//  Created by USERESB390 on 13/04/22.
//

import SwiftUI


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

struct ProductView: View {
    var body: some View {
        VStack(alignment:.leading){
            Image("chair_1")
                .resizable()
                .cornerRadius(20.0)
            
            Text("Luxuary Swedeen")
            Text("Chair")
            
            HStack{
                HStack{
                    ForEach(0 ..< 5){
                        item in
                        Image("star")
                    }
                    
                }
                Spacer()
                Text("$1299")
            }
        }
        .frame(width: 170, height: 220)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct ProductListView: View {
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Populer")
                .font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color.black)
            
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        ProductView()
                    }
                }
            }
        }
        .padding()
    }
}
