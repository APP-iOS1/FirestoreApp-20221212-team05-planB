
import SwiftUI

struct MemberView: View {
    @EnvironmentObject var rollingStore: RollingStore
    @State private var isShowingSheet = false
    @State var message: String = ""
    var team: Team
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        
        ZStack {
            
            Color(hue: 0.102, saturation: 0.224, brightness: 0.918)
                .ignoresSafeArea()
            
            // 멤버들을 그리드로 정렬
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(rollingStore.members,id: \.self) { item in
                    
                    //멤버를 클릭하면 롤링페이퍼 작성화면으로 이동
                    NavigationLink(destination: WriteMessageView(item: item, team: team)) {
                        
                        // AddMemberSheetView에서 입력한 조원 이름과 선택한 컬러의 편지지로 조원 생성됨.
                        NavigationLinklabel(item: item)
                    }//NavigationLink
                }//ForEach
            }//LazyVGrid
            .fullScreenCover(isPresented: $isShowingSheet, content: {
                
                //toolbar 오른쪽 add버튼을 클릭하면 멤버를 추가할 수 있는 sheet 올라옴
                AddMemberSheetView(isShowingSheet: $isShowingSheet, team: team, rollingStore: rollingStore)
            })
            .navigationTitle("롤링페이퍼")
            .onAppear { rollingStore.fetchMember(team: team) }
            .toolbar { MemberToolbar() }
        }
//        .ignoresSafeArea()

        
    }
    func NavigationLinklabel(item: Member) -> some View {
        VStack {
            
            //asset에 편지지 이미지의 이름을 컬러로 구성
            //컬러이름을 string으로 반환하여 사용
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

