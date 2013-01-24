dt <- data.frame(a=rep(1:2, each=4), b=rep(1:2, 4), x=rnorm(8), y=rnorm(8))
regr <- dlply(dt, .(a,b), function(df) lm(y~x, data=df) )
regr
attributes(regr)$split_labels

# Oppsummering
reps <- rpois(10, 4)
minedata <- data.frame(lokalitet = rep(LETTERS[1:10], reps), 
                       plott = sample(1:2, sum(reps), replace=TRUE),
                       måling=rnorm(sum(reps), 10, 3) )

minedata.summ       <- ddply(minedata, .(lokalitet, plott), summarize, antall = length(måling), snitt = sum(måling), st.avvik = sd(måling), spenn = max(måling)-min(måling))

# now this is a change, just to test GIT


# også:
minedata.summ.array <- daply(minedata, .(lokalitet), summarize, antall = length(lokalitet), snitt = sum(måling), st.avvik = sd(måling))
minedata.summ.liste <- dlply(minedata, .(lokalitet), summarize, antall = length(lokalitet), snitt = sum(måling), st.avvik = sd(måling))
minedata.summ.liste$A
boxplot(måling ~ lokalitet, data=minedata)



