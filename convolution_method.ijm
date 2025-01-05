for (i = 1; i <= Max; i++)
{
imagePath = "Path_to_/”+i+”-th_image";
open(imagePath);
selectImage("”+i+”-th_image");
// Perform the convolution
run("Convolve...", "text1=[0 0 -1 -1 -1 0 0\n0 -1 -1 -1 -1 -1 0\n-1 -1 0 0 0 -1 -1\n-1 -1 0 24 0 -1 -1\n-1 -1 0 0 0 -1 -1\n0 -1 -1 -1 -1 -1 0\n0 0 -1 -1 -1 0 0\n\n] normalize");
 
    	// Preparing Green layer of the image
    	run("RGB Stack");
    	run("Stack to Images");
    	selectImage("Red");
    	close();
    	selectImage("Blue");
    	close();
    	selectImage("Green");
    
    	// Threshold
    	setAutoThreshold("Mean no-reset");
    	run("Convert to Mask");
	
	// Counting
    	run("Analyze Particles...", "size=100-400 summarize");
    	
    	// Saving mask
	selectImage("Green");
saveAs("Jpeg", "Path_to_save/”+i+”-th_mask");
    	
//Close the green image :)
    	selectImage("Green");
    	close();
}

 // Save the results to a CSV file 
    savePath = "Path_to_save/CSV_file";
    selectWindow("Summary");
    saveAs("Results", savePath);
    
 // Close the Results window
    run("Clear Results");
