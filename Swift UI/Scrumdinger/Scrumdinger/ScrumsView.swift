import SwiftUI

struct ScrumsView:View {
    let scrums:[DailyScrum]
    var body: some View {
        List(scrums){ scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Provider:PreviewProvider{
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
        }
}
