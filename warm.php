<?php
ini_set('memory_limit', '-1');

$directoryIterator = new RecursiveDirectoryIterator("/application");
$iterator = new RecursiveIteratorIterator($directoryIterator);
$phpFileIterator = new RegexIterator($iterator, '/^.+\.php$/i', RecursiveRegexIterator::GET_MATCH);

foreach ($phpFileIterator as $name => $cur) {
    echo "Warming {$name}...".PHP_EOL;
    opcache_compile_file($name);
}
