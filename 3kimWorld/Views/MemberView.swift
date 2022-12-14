
import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
    @EnvironmentObject var rollingStore: RollingStore
    var team: Team
    
    var body: some View {
        List(rollingStore.members) {item in
            NavigationLink(item.name) { MemberViewBody(item: item, team: team) }
        }//List
        .navigationTitle("롤링페이퍼")
        .onAppear { rollingStore.fetchMember(team: team) }
        .toolbar { MemberViewToolbar(team:team) }
    }//body
}//struct MemberView


//struct MemberView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberView(paper: RollingStore().papers[0])
//    }
//}
