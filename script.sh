#!/bin/bash
 #  for i in $(git tag); do echo $i done

for i in $(git tag); do
	echo "Working on Branch $i"
	echo $i

	git checkout $i

	branch=$(git describe --tags)

	mkdir -p "${branch}_report"

	mvn org.owasp:dependency-check-maven:3.3.2:check -l "${branch}_report/mvn_errors.txt" -Dmaven.test.skip=true


	mv "${PWD}/target/dependency-check-report.html" "${branch}_report/"

done