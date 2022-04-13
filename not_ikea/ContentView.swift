//
//  ContentView.swift
//  not_ikea
//
//  Created by USERESB390 on 13/04/22.
//

import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct ContentView: View {
    
    
    @State private var selectedCategory: Int = 0;
    private let categories = ["All", "Chair", "Lamp", "Sofa", "Kitchen", "Table"]
    
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                AppBarView()
                TitleView()
                    .padding(.all)
                
                SearchView()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(1 ..< categories.count){
                            item in
                            CategoriesView(isActive: item == selectedCategory, text:categories[item])
                                .onTapGesture {
                                    selectedCategory = item
                                }
                        }
                    }
                    .padding(.leading)
                }
                ScrollView {
                    VStack{
                        ProductListView()
                        ProductListView()
                    }
                }
                
                Spacer()
            }
            
            
        }
    }
}



struct TitleView: View {
    var body: some View{
        Text("Find the \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text(" Furniture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}


struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 42, height: 42)
                .cornerRadius(10.0)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        
    }
}

struct SearchView: View{
    @State private var search: String = ""
    
    
    
    var body: some View{
        
        HStack{
            HStack{
                Image("Search")
                
                TextField("Search Here", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            
            Image(systemName: "checkmark.circle")
                .foregroundColor(Color.white)
                .padding()
                .background(Color("Primary"))
                .cornerRadius(10.0)
        }
        .padding()
    }
}

struct CategoriesView: View {
    let isActive : Bool
    let  text : String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .foregroundColor(Color("Primary"))
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2 )
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}
