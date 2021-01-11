#! /usr/bin/bash
#set -x

#Generatex tex header files for lecture specified by first argument

export i=$1

cat > ${i}-lecture-unfilled.tex <<EOF
\documentclass[aspectratio=169,13pt]{beamer}

\input{preamble-unfilled}
\input{preamble}
\input{${i}-body}

\end{document}
EOF
