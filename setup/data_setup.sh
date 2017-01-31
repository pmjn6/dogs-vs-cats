#this batch file organizes the dogcat data for the deep learning
#change the directory to a suitable place
#replace the USERNAME and PASSWORD with their value
#mkdir -p data/redux
#cd data/redux
#kg download -u $USERNAME -p $PASSWORD -c dogs-vs-cats-redux-kernels-edition
unzip test.zip
unzip train.zip
#rm test.zip
#rm train.zip
cd train
source=`pwd`
mkdir dog cat
echo moving cat files to cat folder
for f in cat*; do mv $f cat/$f; done
echo moving dog files to dog folder
for f in dog*; do mv $f dog/$f; done
cd ..
mkdir valid
cd valid
dist=`pwd`
mkdir dog cat
echo moving random dog files to dog folder
ls $source/dog|gshuf|tail -n2000 |while read f; do mv $source/dog/$f $dist/dog; done;
echo moving random cat files to cat folder
ls $source/cat|gshuf|tail -n2000 |while read f; do mv $source/cat/$f $dist/cat; done;
cd ..
mkdir sample 
cd sample
dist=`pwd`
mkdir -p train/dog
mkdir -p train/cat
ls $source/dog|gshuf|tail -n20 |while read f; do cp -ip $source/dog/$f $dist/train/dog; done;
ls $source/cat|gshuf|tail -n20 |while read f; do cp -ip $source/cat/$f $dist/train/cat; done;
mkdir -p valid/dog
mkdir -p valid/cat
ls $source/dog|gshuf|tail -n10 |while read f; do cp -ip $source/dog/$f $dist/valid/dog; done;
ls $source/cat|gshuf|tail -n10 |while read f; do cp -ip $source/cat/$f $dist/valid/cat; done;
#clone pejman's github
cd ../../..
git clone git@github.com:pmjn6/dogs-vs-cats.git
