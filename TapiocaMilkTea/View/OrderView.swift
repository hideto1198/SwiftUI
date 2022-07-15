//
//  OrderView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderStore: OrderStore
    @State var flavor: Int = 0
    @State var nataDeCoco: Bool = false
    @State var iceCream: Int = 0
    @State var quantity: Int = 1
    @State var other: String = ""
    @State var toSave: Bool = false
    @State var isSave: Bool = false
    
    var body: some View {
        ScrollView{
            TapiocaTeaView(iceCream: self.iceCream, flavor: self.flavor, nataDeCoco: self.nataDeCoco)
                .frame(width: 350, height: 350)
            VStack {
                HStack{
                    Text("Select flavor")
                    Spacer()
                    Picker(selection: self.$flavor, label: Text("")){
                        ForEach(0 ..< flavorArray.count, id: \.self) {
                            Text(flavorArray[$0])
                        }
                    }
                }
                
                Toggle(isOn: self.$nataDeCoco) {
                    Text("Nata de coco topping")
                }
                Text("Ice cream topping")
                Picker(selection: self.$iceCream, label: Text("")){
                    ForEach(0 ..< iceCreamArray.count, id: \.self){
                        Text(iceCreamArray[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Stepper(value: self.$quantity, in: 1 ... 10){
                    Text("Quantity : \(self.quantity)")
                }
                
                TextField("Other request", text: self.$other)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Divider()
                
                Button(
                    action: {
                        self.toSave = true
                    }
                ){
                    Text("Order")
                }
            }
            .padding()
            
            Spacer()
                .alert(isPresented: self.$toSave){
                    Alert(
                        title: Text("Message"),
                        message: Text("Save?"),
                        primaryButton: .default(Text("yes"),
                                                action:{
                                                    self.save()
                                                }),
                        secondaryButton: .cancel(Text("cancel"))
                    )
                }
            Spacer()
                .alert(isPresented: self.$isSave){
                    Alert(
                        title: Text("Message"),
                        message: Text("The oreder was saved successfully"),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
    }
        
    private func save(){
        orderStore.orders.append(
            OrderEntity(
                id: UUID().uuidString,
                flavor: self.flavor,
                iceCream: self.iceCream,
                nataDeCoco: self.nataDeCoco,
                other: self.other,
                date: Date(),
                quantity: self.quantity,
                favorite: false
            )
        )
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.isSave = true
            self.clear()
        }
    }
    
    private func clear(){
        self.flavor = 0
        self.nataDeCoco = false
        self.iceCream = 0
        self.quantity = 1
        self.other = ""
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(OrderStore())
    }
}
