import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SwiftUIPullToRefresh: UIViewRepresentable {
    
    let action: () -> Void
    @Binding var isShowing: Bool
    
    public init(
        action: @escaping () -> Void,
        isShowing: Binding<Bool>
    ) {
        self.action = action
        _isShowing = isShowing
    }
    
    public class Coordinator {
        let action: () -> Void
        let isShowing: Binding<Bool>
        
        init(
            action: @escaping () -> Void,
            isShowing: Binding<Bool>
        ) {
            self.action = action
            self.isShowing = isShowing
        }
        
        @objc
        func onValueChanged() {
            isShowing.wrappedValue = true
            action()
        }
    }
    
    public func makeUIView(context: UIViewRepresentableContext<SwiftUIPullToRefresh>) -> UIView {
        return UIView(frame: .zero)
    }
    
    private func scrollView(root: UIView) -> UIScrollView? {
        for subview in root.subviews {
            if let scrollView = subview as? UIScrollView {
                return scrollView
            } else if let scrollView = scrollView(root: subview) {
                return scrollView
            }
        }
        return nil
    }
    

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwiftUIPullToRefresh>) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let viewHost = uiView.superview?.superview else {
                return
            }
            guard let scrollView = self.scrollView(root: viewHost) else {
                return
            }
            
            if let refreshControl = scrollView.refreshControl {
                if self.isShowing {
                    refreshControl.beginRefreshing()
                } else {
                    refreshControl.endRefreshing()
                }
                return
            }
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(context.coordinator, action: #selector(Coordinator.onValueChanged), for: .valueChanged)
            scrollView.refreshControl = refreshControl
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(action: action, isShowing: $isShowing)
    }
}

