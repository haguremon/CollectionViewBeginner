//
//  ViewController.swift
//  CollectionViewBeginner
//
//  Created by IwasakIYuta on 2021/07/20.
//

import UIKit

class ViewCollectionController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items: [String] = ["1","2","3","4","5","6","7","8"]
    let layout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        //topはsectionとの縦の間、leftは横の間
        collectionView.isScrollEnabled = true
        layout.sectionInset = UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: 0,
        right: .zero)
        layout.minimumLineSpacing =  0//セルとの縦の間
        layout.minimumInteritemSpacing = 0 //横の間
        collectionView.collectionViewLayout = layout
    }
    @IBAction func exit(segue: UIStoryboardSegue){}

}



extension ViewCollectionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
     return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            layout.scrollDirection = .horizontal
            return items.count
        case 1:
            return items.count
        case 2:
            layout.scrollDirection = .horizontal
            return items.count
        case 3:
            return items.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.layer.frame.size = CGSize(width: 130, height: 100)
        cell.layer.cornerRadius = 20
        cell.label.text = items[indexPath.row]
        //絶対もっと良い方法あるやろう↓
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .green
            return cell
        case 1:
            cell.backgroundColor = .blue
            return cell
        case 2:
            cell.backgroundColor = .brown
            return cell
        case 3:
            cell.backgroundColor = .clear
            return cell
        case 4:
            cell.backgroundColor = .cyan
            return cell
        case 5:
            cell.backgroundColor = .darkGray
            return cell
        default:
            return cell
        }
        //return cell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            return layout.scrollDirection = .horizontal
        case 1:
            return   layout.scrollDirection = .vertical
        case 2:
            return layout.scrollDirection = .horizontal
        case 3:
            return   layout.scrollDirection = .vertical
        default:
            print("")
        }
    }
    //UICollectionViewDelegateメソッドdidSelectを認識することができるtap
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(items[indexPath.row])")
        let vc2 = storyboard?.instantiateViewController(identifier: "vc2") as! ViewController2
        vc2.collectionValue = items[indexPath.row]
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
}
//CollectionView全体と枠との間隔を調整ができる
extension ViewCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
           let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
           return CGSize(width: cellSize, height: cellSize)
    }
    //セクション毎にUIEdgeInsetsを決めることができるメソッドUIEdgeInsetsはマージンを決めるって認識やけど合ってるのか？
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -15)
        case 1:
            return UIEdgeInsets(top: -5, left: 20, bottom: 20, right: 0)
            //topが上のセクションにぶつかるとエラー
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
//collectionViewmovo

}
