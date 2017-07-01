library(keras)

### Reading ##################################################################

train_data <- readRDS("data/train/train.rds")
train_labels <- readRDS("data/train/train_labels.rds")

test_data <- readRDS("data/test/test.rds")
test_labels <- readRDS("data/test/test_labels.rds")
test_data<- array(test_data, dim = c(dim(test_data), 1))

### processing data for convolution network ###################################

ind <- sample(1:dim(train_data)[1], replace = F, size = 800)
valid_data <- train_data[ind,,]
valid_labels <- train_labels[ind]


train_data <- array(train_data, dim = c(dim(train_data), 1))   
train_label <- to_categorical(as.factor(train_labels))                  # one-hot encoding labels
colnames(train_label) <- c("none", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J") 

valid_data <- array(valid_data, dim = c(dim(valid_data), 1))
valid_label <- to_categorical(as.factor(valid_labels))
colnames(valid_label) <- c("none", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J") 

### Building Model #####################################################################

model <- keras_model_sequential()

model %>%
      layer_conv_2d(filters = 28, kernel_size = c(3,3), padding = "same", activation = "relu", input_shape = c(28, 28, 1), data_format = "channels_last") %>%        # dim(?, 28, 28, 28)
      layer_max_pooling_2d(pool_size = c(2,2)) %>%                                                                                                                   # dim(?, 13, 13, 28)            
      layer_conv_2d(filters = 28, kernel_size = c(3,3), activation = "relu") %>%                                                                                     # dim(?, 26, 26, 28)                       
      layer_max_pooling_2d(pool_size = c(2,2)) %>%                                                                                                                   # dim(?, 13, 13, 28)            
      layer_conv_2d(filters = 28, kernel_size = c(3,3), activation = "relu") %>%                                                                                     # dim(?, 26, 26, 28)                       
      layer_dropout(rate = 0.2) %>%
      layer_flatten() %>%                                                                                                                                            # dim(?, 4732)                  
      layer_dense(units = 11, activation = "relu") %>%                                                                                                               # dim(?, 10) 
      layer_dense(units = 11, activation = "relu") %>%                                                                                                               # dim(?, 10) 
      layer_dense(units = 11, activation = "softmax")                                                                                                                # dim(?, 10)                


model %>% compile(
      loss = 'categorical_crossentropy',
      optimizer = optimizer_nadam(lr = 0.002),     # nadam = Adam, RMSprop with Nesterov momentum
      metrics = c('accuracy')
)


history <- model %>% fit(
      train_data, train_label, 
      epochs = 20,
      batch_size = 128,
      validation_split = 0.05,
      callbacks = callback_tensorboard(log_dir = "logs/run_cnn2")    # saving logs for tensorboard visulizations
)

tensorboard()

### Saving model and weights ####
save_model_hdf5(model, "saves/run1_cnn2.h5")
save_model_weights_hdf5(model, "saves/run1_cnn2_weights.h5")

plot(history)

loss_and_metrics <- model %>%
      evaluate(valid_data, valid_label, batch_size= 128)

### Predicting on test set ####
classes <- model %>% predict(test_data)
colnames(classes) <- c("none", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J") 

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

accuracy <- sum(preds == test_labels)/length(n_class)
accuracy

