#library(devtools)
#devtools::install_github("lchiffon/wordcloud2")
library(wordcloud2)
library(readxl)
lista_s <- read_excel("Figuras/figura_pig_cloud/pig_soft.xlsx")
library(RColorBrewer)


wordcloud2(lista_s,size=1.1,figPath ="Figuras/figura_pig_cloud/pig.jpg")

wordcloud2(lista_s,size=1.0,figPath ="Figuras/figura_pig_cloud/pigface.png")




wordcloud2(lista_s,size=0.7,figPath ="Figuras/figura_pig_cloud/pig_load.png")

wordcloud2(lista_s,size=1.2,figPath ="Figuras/figura_pig_cloud/pig_baby.png")






library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


#filePath <- "text_wiki"
text <- readLines("text_wiki.txt")
# Load the data as a corpus
docs <- Corpus(VectorSource(text))

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, "\-")
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("may", "—Chapter")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)
dim(d)
library("writexl")
write_xlsx(as.data.frame(d))

w=d$word





