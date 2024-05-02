import SwiftUI

struct TreeGardenView: View {
    var body: some View {
        ZStack{
            Image("Garden")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Menampilkan koleksi Tree
            VStack(alignment: .center, spacing: 1) {
                
                ForEach(0..<Router.shared.obtainedTrees.count / 3 + 1, id: \.self) { row in
                    HStack(alignment: .firstTextBaseline, spacing: 1) {
                        ForEach(getTreeIndices(forRow: row), id: \.self) { index in
                            Image(Router.shared.obtainedTrees[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 100)
                        }
                        
                    }
                    .offset(x:CGFloat(row) * 1, y: CGFloat(row) * 0)
                    
                }
                HomeButton()
            }
        }
    }
    
    // Mendapatkan indeks Tree untuk baris tertentu
    private func getTreeIndices(forRow row: Int) -> [Int] {
        let startIndex = row * 3
        let endIndex = min(startIndex + 3, Router.shared.obtainedTrees.count)
        return Array(startIndex..<endIndex)
    }
}


#Preview {
    TreeGardenView()
}
