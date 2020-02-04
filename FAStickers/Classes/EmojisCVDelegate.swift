//
//  EmojisCVDelegate.swift
//  FAStickers
//
//  Created by Faris Albalawi on 6/4/19.
//

import UIKit

class EmojisCVDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var EmojiDelegate : StickerEmojiDelegate!
    
    
    let emojiRanges = [
        0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        0x1F1E6...0x1F1FF
    ]

    var emojis: [String] = []
    
    override init() {
        super.init()
        
        for range in emojiRanges {
            for i in range {
                
                guard let scalarValue = Unicode.Scalar(i) else {
                    continue
                }
                
                if scalarValue.properties.isEmoji {
                    //emoji.insert(scalarValue)
                    let c = String(describing: UnicodeScalar(i)!)
                    emojis.append(c)
                }
            }
        }
    }
    
   
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EmojiCell
        cell.emojiLabel.text = emojis[indexPath.item]
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(emojis)
        print(emojis.count)
        print(indexPath.item)
        let emoji = emojis[indexPath.item]
        if emoji != nil {
            EmojiDelegate.EmojiTapped(EmojiName: emoji)
        }
    }
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
