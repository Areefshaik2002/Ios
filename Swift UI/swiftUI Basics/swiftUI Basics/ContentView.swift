import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            BackgroundView(topColor: <#T##Color#>, bottomColor: <#T##Color#>)
            LinearGradient(gradient: Gradient(colors: [.blue,.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Hyderabad, Hyd")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("31°C")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 15){
                    WeatherDayView(dayOfTheWeek: "Sun", ImageName: "cloud.sun.fill", temperature: 34)
                    WeatherDayView(dayOfTheWeek: "Mon", ImageName: "cloud.heavyrain.fill", temperature: 25)
                    WeatherDayView(dayOfTheWeek: "Tue", ImageName: "cloud.drizzle.fill", temperature: 29)
                    WeatherDayView(dayOfTheWeek: "Wed", ImageName: "cloud.rainbow.crop.fill", temperature: 30)
                    WeatherDayView(dayOfTheWeek: "Thur", ImageName: "cloud.sun.fill", temperature: 33)
                    
                }
                Spacer()
                
                Button{
                    print("button clicked")
                }label: {
                    Text("change day view")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(16)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView : View {
    
    var dayOfTheWeek : String
    var ImageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .light, design: .default))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding()
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 80)
            Text("\(temperature)°C")
                .font(.system(size: 16, weight: .light, design: .default))
                .foregroundColor(.white)
                .fontWeight(.medium)
        }
    }
}

//struct BackgroundView: View {
//    
//    var topColor : Color
//    var bottomColor : Color
//    
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.blue,.white]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
