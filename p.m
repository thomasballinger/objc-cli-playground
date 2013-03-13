#import <Foundation/Foundation.h> 

#if !__has_feature(objc_arc)
#error this file needs arc (-fobjc-arc)
#endif

@interface TicTacToe: NSObject
{
    int board[9];
}
@property int whoseTurn;
-(void)    print;
-(int)     winner;
-(bool)    makeMove: (int) pos forPlayer: (int) player;
@end

int get_sigil(int num){
    return num == 0 ? '0' + num : num == 1 ? 'x' : 'o';
}

@implementation TicTacToe
@synthesize whoseTurn;
-(void) print;
{
    NSLog (@"\n%c|%c|%c\n-+-+-\n%c|%c|%c\n-+-+-\n%c|%c|%c\n", get_sigil(board[0]), get_sigil(board[1]), get_sigil(board[2]), get_sigil(board[3]), get_sigil(board[4]), get_sigil(board[5]), get_sigil(board[6]), get_sigil(board[7]), get_sigil(board[8]));
}
-(bool) makeMove: (int) pos forPlayer: (int) player;
{
    if (whoseTurn != player){
        return false;
    }
    if (board[pos] == 0){
        board[pos] = player;
        whoseTurn = 3 - whoseTurn;
        return true;
    }
    return false;
}
-(id)init
{
    for (int i = 0; i<9; i++){
        board[i] = 0;
    }
    whoseTurn = 1;
    return self;
}
-(int) winner;
{
    int p[][3] = {{0,1,2},{3,4,5},{6,7,8},{0,3,6},{1,4,7},{2,5,8},{0,4,8},{2,4,6}};
    for (int i = 0; i<8; i++){
        if (board[p[i][0]] == 1 && board[p[i][1]] == 1 && board[p[i][2]] == 1){
            return 1;
        }
        if (board[p[i][0]] == 2 && board[p[i][1]] == 2 && board[p[i][2]] == 2){
            return 2;
        }
    }
    return 0;
}
@end

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        TicTacToe *game;
        
        game = [TicTacToe new];
        
        while ([game winner] == 0)
        {
            NSLog (@"Type in a position for your move, player %d:", game.whoseTurn);
            int pos;
            scanf ("%d", &pos);
            
            bool result = [game makeMove:pos forPlayer:game.whoseTurn];
            if (result){
                NSLog (@"game move succeeded!");
            }
            
            NSLog (@"the game state is:");
            [game print];
        }
        NSLog (@"\ngame winner is:%d", [game winner]);
    }
    return 0;
}
