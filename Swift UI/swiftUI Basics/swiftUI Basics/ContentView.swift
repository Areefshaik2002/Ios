import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityaTextView(cityName: "Hyderabad Hyd")
                
                MainWeatherStatusView(
                    imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                    temperature: isNight ? 22 : 34
                )
            
                HStack(spacing: 8) {
                    WeatherDayView(dayOfTheWeek: "Sun", ImageName: "cloud.sun.fill", temperature: 34)
                    WeatherDayView(dayOfTheWeek: "Mon", ImageName: "cloud.heavyrain.fill", temperature: 25)
                    WeatherDayView(dayOfTheWeek: "Tue", ImageName: "cloud.drizzle.fill", temperature: 29)
                    WeatherDayView(dayOfTheWeek: "Wed", ImageName: "wind", temperature: 31)
                    WeatherDayView(dayOfTheWeek: "Thu", ImageName: "cloud.sun.fill", temperature: 33)
                }
                .padding(.top, 20)
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "change day time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 19, weight: .light, design: .default))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40) 
            
            Text("\(temperature)°C")
                .font(.system(size: 16, weight: .light, design: .default))
                .foregroundColor(.white)
                .fontWeight(.medium)
        }
        .padding()
    }
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityaTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .light, design: .default))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°C")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
