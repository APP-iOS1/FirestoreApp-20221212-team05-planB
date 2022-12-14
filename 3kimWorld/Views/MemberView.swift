
import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @State var message: String = ""
    var team: Team
    
    var body: some View {
            List {
                ForEach(rollingStore.members,id: \.self) { item in
                    NavigationLink {
                        MemberViewBody(item: item, team: team)
                    } label: {
                        Text("\(item.name)")
                    }
                }
            }
            .navigationTitle("롤링페이퍼")
            .onAppear {
                rollingStore.fetchMember(team: team)
            }
            .toolbar {
                MemberViewToolbar(team:team)
            }
    }
}


//struct MemberView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberView(paper: RollingStore().papers[0])
//    }
//}
