for (i = 1; i <= Max; i++) 
{
imagePath = "Path_to_/”+i+”-th_image";
open(imagePath);
selectImage("”+i+”-th_image");
      	
 	// Preparing Green layer of the image
run("RGB Stack");
run("Stack to Images");
selectImage("Red");
close();
selectImage("Blue");
close();
selectImage("Green");
    
// Threshold
setAutoThreshold("Default no-reset");
setOption("BlackBackground", true);
run("Convert to Mask");

// Apply Watershed
run("Fill Holes");
run("Watershed");

// Saving mask
saveAs("Jpeg", "Path_to_save/”+i+”-th_mask");

// Counting
   	 run("Analyze Particles...", "size=50-400 circularity=0.30-1.00 summarize");

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
