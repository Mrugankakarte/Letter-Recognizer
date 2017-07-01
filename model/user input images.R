library(keras)
library(abind)

### user input test image ################################################################
test_path <- image_load("", grayscale = T, target_size = c(28,28))       # add path of user input file
test_img <- image_to_array(test_path)/255                                # Normalize the test image
test_img <- array(test_img, dim = c(1, dim(test_img)))                   # adding dimension to image to feed into model (converting into proper tensor)


### Load pre-trained model ################################################################

model2 <- load_model_hdf5("saves/run1_cnn2.h5")
load_model_weights_hdf5(model2, filepath = "saves/run1_cnn2_weights.h5")

classes <- model2 %>% predict(test_img) 
n_class <- max.col(classes)

preds <- array(0, dim = length(n_class))
for(i in 1:length(n_class)){
      
      if(n_class[i] == 2)
            preds[i] <- "A"
      else
            if(n_class[i] == 3)
                  preds[i] <- "B"
            else  
                  if(n_class[i] == 4)
                        preds[i] <- "C"
                  else
                        if(n_class[i] == 5)
                              preds[i] <- "D"
                        else
                              if(n_class[i] == 6)
                                    preds[i] <- "E"
                              else
                                    if(n_class[i] == 7)
                                          preds[i] <- "F"
                                    else
                                          if(n_class[i] == 8)
                                                preds[i] <- "G"
                                          else
                                                if(n_class[i] == 9)
                                                      preds[i] <- "H"
                                                else
                                                      if(n_class[i] == 10)
                                                            preds[i] <- "I"
                                                      else
                                                            if(n_class[i] == 11)
                                                                  preds[i] <- "J"
                                                            
                                                            
                                                            
}                #converts number into character

