{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework
import AIPlayer
import TestChessBoards
import TestGameTrees
import ChessUtilTypes
import ChessBoard

test_GameTreeEq = 
    do
        assertEqual True (gameTree16_depth0_White == (cloneTree gameTree16_depth0_White))
        assertEqual True (gameTree16_depth0_Black == (cloneTree gameTree16_depth0_Black))
        assertEqual True (gameTree16_depth1_White == (cloneTree gameTree16_depth1_White))
        assertEqual True (gameTree16_depth1_Black == (cloneTree gameTree16_depth1_Black))
        assertEqual False (gameTree16_depth1_White == gameTree16_depth0_White)
        assertEqual False (gameTree16_depth1_White == gameTree16_depth1_Black)
        assertEqual False (gameTree16_depth1_Black == gameTree16_depth0_Black)


-- Will not pass until makeMove is implemented
test_buildGameTree =
    do
        assertEqual gameTree16_depth0_White (buildGameTree board16 White 0)
        assertEqual gameTree16_depth1_White (buildGameTree board16 White 1)
        assertEqual gameTree16_depth0_Black (buildGameTree board16 Black 0)
        assertEqual gameTree16_depth1_Black (buildGameTree board16 Black 1)


cloneTree (GameTree board score children) = (GameTree board score (map cloneMoveSubtree children))
cloneMoveSubtree :: MoveSubtree -> MoveSubtree
cloneMoveSubtree (MoveSubtree move tree) = (MoveSubtree move (cloneTree tree))

test_score = 
    do
        assertEqual 890 (score board2 Black)
        assertEqual (-890) (score board2 White)
        assertEqual (-80) (score board3 Black)
        assertEqual 80 (score board3 White)


test_getMoveWithMaxScore = 
    do 
        assertEqual board16_W1_Move (getMoveWithMaxScore gameTree16_depth1_White_scores)
        assertEqual board16_B8_Move (getMoveWithMaxScore gameTree16_depth1_Black_scores)

main = htfMain htf_thisModulesTests