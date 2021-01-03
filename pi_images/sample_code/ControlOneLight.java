package edu.skidmore.cs106.pi.lab01;

import us.daveread.raspberrypi.gpio.lib.GpioWidgetPool;
import us.daveread.raspberrypi.gpio.lib.Led;
import us.daveread.raspberrypi.gpio.lib.Utility;

/**
 * Controls a single LED connected to GPIO 0
 * 
 * @author readda
 */
public class ControlOneLight {
	/**
	 * Creates an Led instance associated with GPIO 0 and uses different methods
	 * to control the LED.
	 * 
	 * @param args
	 *            Command line arguments - not used
	 */
	public static void main(String[] args) {
		try {
			// Declare an Led variable
			Led myLight;

			// Create an instance of the Led class
			myLight = new Led(0);

			// Turn the light on for 2 seconds
			myLight.turnOnSolid();
			Utility.pause(2000);

			// leave the light off for 2 seconds
			myLight.turnOff();
			Utility.pause(2000);

			// Make the light blink for 3 seconds
			myLight.turnOnBlink();
			Utility.pause(4000);

			// Turn off the light
			myLight.turnOff();
		} 
		finally {
			// Close the GPIO controller
			// Always do this when your program ends
			GpioWidgetPool.close();
		}
	}
}
