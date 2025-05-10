//
//  HomeScreenView.swift
//  Furniture_app
//
//  Created by Abcom on 10/05/25.
//
 
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("Bg").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment:.leading){
                        AppBarView()
                        TagLineView()
                            .padding()
                        SearchAndScanView()
                        CategoryListView()
                        
                        HorizontalProductListView(title: "Primary", size: 210)
                        HorizontalProductListView(title:"Best", size: 180)
                    }
                    
                }
                //Mark: Custom bottom nav bar
                BottomTabView()
            }
        }
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Image( "menu")
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Image("Profile")
                .resizable()
                .cornerRadius(10)
                .frame(width: 48, height: 48)
        }.padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var searchTerm:String=""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding()
                TextField("Search Furniture", text: $searchTerm)
                
            }.background(Color.white)
                .clipped()
                .cornerRadius(10)
            
            Button(action:{}){
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .renderingMode(.template)
                
                    .frame(width: 34, height: 34)
                    .padding(.all, 8)
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                
            }
            
            
        }
        .padding()
    }
}

struct CategoryView: View {
      let txt:String
      let isActive:Bool
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            Text(txt)
                .foregroundColor(isActive ? Color("Primary"):Color.black.opacity(0.5))
                .font(.system(size:18))
                .fontWeight(.medium)
          if(isActive)  {
                Color("Primary").frame(width: 15, height: 2, alignment: .top)
                    .clipShape(.capsule)
            }
            
        }
    }
}

struct CategoryListView: View {
    private let categories: [String]=["All", "Chairs", "Sofa", "Lamp", "Kitchen", "Table"]
      @State private var activeCategory:Int = 0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment:.center, spacing: 20){
                ForEach(categories.indices, id:\.self){
                    i in
                    Button{
                        activeCategory = i
                    }label: {
                        CategoryView(txt: categories[i], isActive:activeCategory == i ? true : false)
                    }
                }
            }
        }.padding()
    }
}

struct ProductCardView: View {
    let image:Image
    let text:String
    let price:Int
    let size:CGFloat
    var body: some View {
        VStack(alignment:.leading){
            image
                .resizable()
                .frame(width:size, height: 200 * size/210)
                .cornerRadius(20)
            Text( text)
                .font(.title3)
                .fontWeight(.bold)
            HStack(spacing:2){
                ForEach(0...4, id: \.self){_ in
                    Image("star")
                }
                Spacer()
                Text("$\(price)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct HorizontalProductListView: View {
    let title:String
    let size:CGFloat
    var body: some View {
        Text(title)
            .font(.custom("PlayfairDisplay-Bold", size: 24))
            .foregroundColor(Color("Primary"))
            .padding(.horizontal)
            .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<4, id:\.self){
                    index in
                    NavigationLink{
                        DetailScreen()
                    }label: {
                        ProductCardView(image: Image("chair_\(index+1)"), text: "Sweden chair", price: 1500, size: size)
                            .padding(.trailing)
                    }
                    .navigationBarHidden(true)
                    
                }
            }.padding(.horizontal)
            
        }
    }
}

struct BottomBarItem: View {
    let image:Image
    let action:()->Void
    var body: some View {
        Button(action:action){
            image
                .frame(maxWidth: .infinity, )
                .font(.system(size: 24))
                
                .foregroundColor(Color.black )
        }
    }
}

struct BottomTabView: View {
    var body: some View {
        HStack{
            BottomBarItem(image: Image("Home")){
                
            }
            BottomBarItem(image: Image(systemName: "heart")){
                
            }
            BottomBarItem(image: Image(systemName: "cart") ){
                
            }
            BottomBarItem(image: Image("User")){
                
            }
            
            
        }   .padding()
            .background(Color.white)
        
            .clipShape(.capsule)
            .padding()
            .shadow(color:Color.black.opacity(0.15),radius: 10, x:2, y:10)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}


