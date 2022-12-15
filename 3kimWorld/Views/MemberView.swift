
import SwiftUI



//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
    //    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var rollingStore: RollingStore
    @State private var isShowingSheet = false
    @State var message: String = ""
    var team: Team
    let columns = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        ZStack {
            Color(hue: 0.102, saturation: 0.224, brightness: 0.918)
                .ignoresSafeArea()
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(rollingStore.members,id: \.self) { item in
                    NavigationLink {
                        WriteMessageView(item: item, team: team)
                    } label: { NavigationLinklabel() }
                }
            }
            .fullScreenCover(isPresented: $isShowingSheet, content: {
                AddMemberSheetView(isShowingSheet: $isShowingSheet, team: team, rollingStore: rollingStore)
            })
            .navigationTitle("롤링페이퍼")
            .onAppear { rollingStore.fetchMember(team: team) }
            .toolbar { MemberToolbar() }
        }
//        .ignoresSafeArea()

        
    }
    func NavigationLinklabel() -> some View {
        VStack {
            Image(item.color.1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("\(item.name)")
                .font(.custom("UhBee mysen", size: 25))
                .foregroundColor(.black)
                .lineSpacing(5)
        }
    }
    
    func MemberToolbar() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isShowingSheet.toggle()
            } label: {
                Text("add")
                
            }
            
        }
    }
    
    
}

