//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack {
           HomeScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Luxury chair")
                .font(.title)
                .fontWeight(.bold)
            HStack{
                ForEach(0...4, id: \.self){
                    _ in
                    Image("star")
                    
                    
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
                
            }
            VStack(alignment:.leading){
                HStack{
                    Text("Description")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .foregroundColor(Color("Primary"))
                    
                    Text("Review").fontWeight(.medium)
                        .padding(.vertical, 8)
                    Spacer()
                }
                Text("Updated the isActive condition to reflect the actual state, so the correct category is highlighted.Updated the isActive condition to reflect the actual state, so the correct category is highlighted.")
                    .lineSpacing(8)
                    .opacity(0.6)
                HStack(alignment:.top){
                    VStack(alignment: .leading){
                        Text("Size").fontWeight(.semibold)
                            .padding(.bottom, 4)
                        Text("Height: 120cm")
                            .opacity(0.6)
                        Text("Wide: 80cm")
                            .opacity(0.6)
                        Text("Diameter: 72cm")
                            .opacity(0.6)
                        
                        
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                         
                    VStack(alignment:.leading){
                        Text("Treatment").fontWeight(.semibold).padding(.bottom, 4)
                        Text("Jati wood, canvas, \nAmazing love")
                            .opacity(0.6)
                            
                    }.frame(maxWidth: .infinity, alignment: .leading)
                         
                }.padding(.vertical)
                
                HStack{
                    VStack(alignment:.leading){
                        Text("Colors").fontWeight(.semibold)
                        HStack(spacing:15){
                            ColorDotView(color:Color.white)
                            ColorDotView(color:Color.black)
                            ColorDotView(color:Color("Primary"))
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment:.leading){
                        Text("Quantity")
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button{}label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 12))
                                    .padding(.all, 8)
                            }
                            .frame(width:24, height: 24)
                            .overlay(
                                RoundedRectangle(cornerRadius:50).stroke()
                            )
                            .foregroundColor(Color.black)
                            
                            
                            Text("1").font(.title2).fontWeight(.semibold)
                                .padding(.horizontal, 8)
                            Button{
                                
                            }label: {
                                Image(systemName: "plus").font(.system(size: 14))
                                    .foregroundColor(Color.white)
                                
                            }.frame(width: 24, height: 24).background(Color("Primary"))
                                .clipShape(Circle())
                                
                                
                        }
                    } .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
        }.padding().background(Color("Bg"))
            .cornerRadius(40)
    }
}

struct ColorDotView: View {
    let color:Color
    var body: some View {
        color.frame(width: 24, height: 24)
            .clipShape(.circle)
    }
}

struct DetailScreen: View {
    var body: some View {
        ZStack{
            Color("Bg").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView()
                        .offset(y:-40)
                }
            }
            
            HStack{
                HStack{
                    Text("$1299")
                        .font(.title)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Add to Cart")
                            .fontWeight(.semibold)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(Color("Primary"))
                        
                        
                    }.padding(.horizontal)
                    
                }
                .padding()
                .padding(.bottom)
                .padding(.trailing, 50)   .padding(.horizontal).background(Color("Primary")) .clipShape(.capsule)
                .offset(x:15, y:15)
            }
            
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
            
            
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden()
    }
}
