//
//  ImageView+Rx.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIImageView {
    var imageBinding: Binder<String> {
        return Binder(base) { imageView, urlString in
            let url = URL(string: urlString)
            imageView.sd_setImage(with: url) { (_, _, _, _) in
                base.hideSkeleton()
            }
        }
    }
}
