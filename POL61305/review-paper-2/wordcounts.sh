echo ""
echo "Word counts:"

abstract_words=`texcount -sub -brief -q -template="{1}" abstract.tex`
intro_words=`texcount -sub -brief -q -template="{1}" introduction.tex`
body_words=`texcount -sub -brief -q -template="{1}" body.tex`
conc_words=`texcount -sub -brief -q -template="{1}" conclusions.tex`
total_words=$((intro_words + body_words + abstract_words + conc_words))

abstract_percent=`bc -l <<<"100.0 / $total_words * $abstract_words"`
intro_percent=`bc -l <<<"100.0 / $total_words * $intro_words"`
body_percent=`bc -l <<<"100.0 / $total_words * $body_words"`
conc_percent=`bc -l <<<"100.0 / $total_words * $conc_words"`

echo -e "  Abstract:\t\t\t$anal_words\t (${abstract_percent%.*}%)"
echo -e "  Introduction:\t\t\t$intro_words\t\t (${intro_percent%.*}%)"
echo -e "  Body :\t$body_words\t\t (${body_percent%.*}%)"
echo -e "  Conclusions:\t\t\t$conc_words\t\t (${conc_percent%.*}%)"

echo "Total: $total_words"
echo "$((intro_words + body_words + abstract_words + conc_words))" > totalwords.tex
