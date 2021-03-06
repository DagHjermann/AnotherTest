dt <- data.frame(a=rep(1:2, each=4), b=rep(1:2, 4), x=rnorm(8), y=rnorm(8))
regr <- dlply(dt, .(a,b), function(df) lm(y~x, data=df) )
regr
attributes(regr)$split_labels

# Oppsummering
reps <- rpois(10, 4)
minedata <- data.frame(lokalitet = rep(LETTERS[1:10], reps), 
                       plott = sample(1:2, sum(reps), replace=TRUE),
                       m�ling=rnorm(sum(reps), 10, 3) )

minedata.summ       <- ddply(minedata, .(lokalitet, plott), summarize, antall = length(m�ling), snitt = sum(m�ling), st.avvik = sd(m�ling), spenn = max(m�ling)-min(m�ling))

# now this is a change, just to test GIT


# ogs�:
minedata.summ.array <- daply(minedata, .(lokalitet), summarize, antall = length(lokalitet), snitt = sum(m�ling), st.avvik = sd(m�ling))
minedata.summ.liste <- dlply(minedata, .(lokalitet), summarize, antall = length(lokalitet), snitt = sum(m�ling), st.avvik = sd(m�ling))
minedata.summ.liste$A
boxplot(m�ling ~ lokalitet, data=minedata)



