//
//  ViewController.swift
//  chess
//
//  Created by 溫皓 on 2023/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chessBoardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let square = chessBoardView.frame.width / 8 // 每個方格的大小
        
        let pieces = [
            chessPiece(row: 1, column: Array(0...7), image: "♟"), // 棋子的資訊
            chessPiece(row: 0, column: [0, 7], image: "♜"),
            chessPiece(row: 0, column: [1, 6], image: "♞"),
            chessPiece(row: 0, column: [2, 5], image: "♝"),
            chessPiece(row: 0, column: [3], image: "♛"),
            chessPiece(row: 0, column: [4], image: "♚"),
            chessPiece(row: 6, column: Array(0...7), image: "♙"),
            chessPiece(row: 7, column: [0, 7], image: "♖"),
            chessPiece(row: 7, column: [1, 6], image: "♘"),
            chessPiece(row: 7, column: [2, 5], image: "♗"),
            chessPiece(row: 7, column: [3], image: "♕"),
            chessPiece(row: 7, column: [4], image: "♔")
        ]
        
        // 迴圈用於建立棋盤上的每個方格
        for row in 0...7 {
            for column in 0...7 {
                let chessSquareImageView = UIImageView(frame: CGRect(x: square * CGFloat(column), y: square * CGFloat(row), width: square, height: square))
                
                // 根據棋盤位置設定方格的背景顏色
                if (row + column) % 2 == 0 {
                    chessSquareImageView.backgroundColor = UIColor.brown
                } else {
                    chessSquareImageView.backgroundColor = UIColor.systemBrown
                }
                
                chessBoardView.addSubview(chessSquareImageView)
                
                // 檢查是否在該位置有棋子，如果有就加入標籤
                for piece in pieces {
                    // 檢查棋子的行數和列數是否與當前的迴圈索引值(row, column)相符
                    if piece.row == row && piece.column.contains(column) {
                        // 建立一個 UILabel 來顯示棋子的圖像
                        let chessPieceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: square, height: square))
                        chessPieceLabel.textAlignment = .center // 將文字置中對齊
                        chessPieceLabel.font = UIFont.systemFont(ofSize: square * 1) // 設定字體大小
                        chessPieceLabel.text = piece.image // 設定文字內容為棋子的圖像表示
                        chessSquareImageView.addSubview(chessPieceLabel) // 將棋子標籤添加到棋盤方塊的視圖中
                    }
                }

                }
            }
        }
    }


//#Preview {
   // UIViewController()
//}

