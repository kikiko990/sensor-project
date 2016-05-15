//
//  ViewController.m
//  asdasd
//
//  Created by Martin Trinh on 15/05/16.
//  Copyright © 2016 Martin Trinh. All rights reserved.
//

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
    // Dispose of any resources that can be recreated.
}

/**@brief Function for handling the data from the Nordic UART Service.
 
 *
 
 * @details This function will process the data received from the Nordic UART BLE Service and send
 
 * it to the UART module.
 
 *
 
 * @param[in] p_nus Nordic UART Service structure.
 
 * @param[in] p_data Data to be send to UART module.
 
 * @param[in] length Length of the data.
 
 */

/**@snippet [Handling the data received over BLE] */
static void handler(uint8_t * data, uint16_t length) {
    
    // Print the incoming data for debugging purposes
    printf("UART data received: %s \r\n", data);
    
    // Look for strings starting with the command "INTENSITY="
    if(strstr((char*)data, "INTENSITY=") == (char*)data) {
        
        // Convert the intensity from a string to an integer
        int intensity = 0;
        
        for(int i = 0; i < 3; i++){
            intensity = intensity * 10 + data[(i + strlen("INTENSITY="))];
        }
        // Print the intensity
        printf("Intensity set to %i \r\n", intensity);
        
    }
    
    // Look for string starting with the command "MODE="
    
    else if(strstr((char*)data, "MODE=") == (char*)data) {
        
        // Look for the values "ON" or "OFF" at index 5 in the string
        if(strstr((char*)data[5], "ON") == (char*)data[5]) {
            printf("Mode on \r\n");
        }
        
        else if(strstr((char*)data[5], "OFF") == (char*)data[5]) {
            printf("Mode off \r\n");
            
        }
        
    }
    
}

/**@snippet [Handling the data received over BLE] */
@end
