echo ""
echo "Word counts:"

intro_words=`texcount -sub -brief -q -template="{1}" introduction.tex`
tf_words=`texcount -sub -brief -q -template="{1}" theoretical_framework.tex`
anal_words=`texcount -sub -brief -q -template="{1}" analysis.tex`
conc_words=`texcount -sub -brief -q -template="{1}" conclusions.tex`
total_words=$((intro_words + tf_words + anal_words + conc_words))

intro_percent=`bc -l <<<"100.0 / $total_words * $intro_words"`
tf_percent=`bc -l <<<"100.0 / $total_words * $tf_words"`
anal_percent=`bc -l <<<"100.0 / $total_words * $anal_words"`
conc_percent=`bc -l <<<"100.0 / $total_words * $conc_words"`

echo -e "  Introduction:\t\t\t$intro_words/450\t\t (${intro_percent%.*}%)"
echo -e "  Theoretical framework:\t$tf_words/300\t\t (${tf_percent%.*}%)"
echo -e "  Analysis:\t\t\t$anal_words/2100\t (${anal_percent%.*}%)"
echo -e "  Conclusions:\t\t\t$conc_words/450\t\t (${conc_percent%.*}%)"

echo "Total: $total_words/3000"
echo "$((intro_words + tf_words + anal_words + conc_words))" > totalwords.tex
