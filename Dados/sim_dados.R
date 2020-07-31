sim_dados=function(n,dias){

x=NULL

for (d in 1:dias){
  x=c(x,rep(d,n))
}

id=rep(1:n,dias)

set.seed(123)
y=rep(sample(c("A","B","C","D"),n,replace=TRUE),dias)

peso=rep(0,length(x))
for (d in 1:dias){
  peso[which(y=="A" & x==d)]=rnorm(length(which(y=="A" & x==d)),mean=((6.6)+6*d/8),sd=10*log(log(d)+1))
  peso[which(y=="B" & x==d)]=rnorm(length(which(y=="B" & x==d)),mean=((6.6)+6*d/7),sd=10*log(log(d)+1))
  peso[which(y=="C" & x==d)]=rnorm(length(which(y=="C" & x==d)),mean=((6.6)+6*d/6),sd=10*log(log(d)+3))
  peso[which(y=="D" & x==d)]=rnorm(length(which(y=="D" & x==d)),mean=((6.6)+6*d/5),sd=10*log(log(d)+3))
}

sim_data=data.frame(Id=id,Dias=x,Dieta=y,Peso=peso)
} 