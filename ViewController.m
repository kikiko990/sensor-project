
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    handler("INTENSITY=123", 0);
    handler("MODE=ON", 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


static void handler(uint8_t * data, uint16_t length) {
    
    printf("UART data received: %s \r\n", data);
    
    if(strstr((char*)data, "INTENSITY=") == (char*)data) {
        
        int intensity = 0;
        
        for(int i = 0; i < 3; i++){
            intensity = intensity * 10 + data[(i + strlen("INTENSITY="))];
        }
        printf("Intensity set to %i \r\n", intensity);
        
    }
    

    else if(strstr((char*)data, "MODE=") == (char*)data) {
        
        if(strstr((char*)data[5], "ON") == (char*)data[5]) {
            printf("Mode on \r\n");
        }
        
        else if(strstr((char*)data[5], "OFF") == (char*)data[5]) {
            printf("Mode off \r\n");
            
        }
        
    }
    
}

@end
