#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
APP='./bin/hash';
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# run app
function run_app()
{
	if [ "${FLAG_VALGRIND}" != "1" ];
	then
		STDOUT=$(cat | ${APP} "${@}");
	else
		VAL="valgrind --tool=memcheck --leak-check=yes --leak-check=full --show-reachable=yes --log-file=valgrind.log";

		STDOUT=$(cat | ${VAL} ${APP} "${@}");

		echo '--------------------------' >> valgrind.all.log;
		cat valgrind.log >> valgrind.all.log;
		rm -rf valgrind.log;
	fi


	if [ "${STDOUT}" != "" ];
	then
		echo "${STDOUT}";
	fi
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
function check()
{
	HASH=${3};
	RESULT=$(echo -n "${1}" | run_app -"${2}");
	if [ "${RESULT}" != "${HASH}" ];
	then
		echo "ERROR: result different for "${2}"...";
		echo "RESULT : ${RESULT}";
		echo "HASH   : ${HASH}";
		exit 1;
	fi
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# test
function test_it()
{
	check 'Mom'                                   'crc16'  'ca0d';
	check 'Mom wash'                              'crc16'  '6afd';
	check 'Mom wash window frame'                 'crc16'  'fec0';
	check 'Mom wash window frame and Shura balls' 'crc16'  'c19a';

	check 'Mom'                                   'crc32'  '5665ad0c';
	check 'Mom wash'                              'crc32'  '2769fdb4';
	check 'Mom wash window frame'                 'crc32'  '660246ce';
	check 'Mom wash window frame and Shura balls' 'crc32'  '18a5b32d';

	check 'Mom'                                   'md5'    'c988fa7c33ce43962b9803702b747a35';
	check 'Mom wash'                              'md5'    '497a01dabfa0f13649457d4773e184f9';
	check 'Mom wash window frame'                 'md5'    '399ce6cc07894050d7645aae84fab537';
	check 'Mom wash window frame and Shura balls' 'md5'    'e5794a4a922e4a5f438a229f8c89d008';

	check 'Mom'                                   'sha1'   '0967082f2aa15d0a0c0acc03ed8e64555840f63f';
	check 'Mom wash'                              'sha1'   '6d56273df975bbc6ef1eed1ec18368843647588c';
	check 'Mom wash window frame'                 'sha1'   '3fa55a9fbceb88f31faaa8f69b04a109ffddc3aa';
	check 'Mom wash window frame and Shura balls' 'sha1'   '95afdf31b23f267e97b88c88553cdd325d9f5b52';

	check 'Mom'                                   'sha256' 'e65ccf65df25d3febdca240545e8682bb967ee59b7b522e6cefa071918a4291a';
	check 'Mom wash'                              'sha256' '3638ad6508f0c8ffb89dee1d62c24e282760ef824124d82d75ad1e6c494ef315';
	check 'Mom wash window frame'                 'sha256' '00e4aee92fbc4c1b67a5e76548ea9d463f3e79fa4452265da601a2f685cf274d';
	check 'Mom wash window frame and Shura balls' 'sha256' '48b4fbcefc3826a1a06aa006f86b969b3a321fe75cd748f6c9a4783328549cf8';

	check 'Mom'                                   'sha512' 'd621f4ecdf2e7c464ab8035c86c2a74951c9562495d4ce34efcc8969661741096a7889a194135e58212edf6ccc835a222ef2679e78a87137769f5712c65d78a2';
	check 'Mom wash'                              'sha512' 'c1ee6ecf992504ebeb595ff223100f7818d37d8ef39ac26bc15de9bf6bb1fc0c5fb79291f17d485d8de761d553dc154bd1ea6d8e3c8d485bf1f1c92e3fea8403';
	check 'Mom wash window frame'                 'sha512' '10fa3f1c5f7a1997c3e4de3c95cebb3cf8d9ea13a517b33a0c8dba56c3bb2fbeeb7d3fb0e77735a02acbf857e50c0ece65d07e8f8c7ad8bda05e95383fe0a028';
	check 'Mom wash window frame and Shura balls' 'sha512' '7706747799340b879088d200ea5e8888882acae9cdd55f44c87fc23f7a39791bd1015aaf8a9ff5eaa8eee39ad7e97e9ec6b559c7aff3af794205a1fe05ee1063';
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# check depends
function check_prog()
{
	for i in ${1};
	do
		if [ "$(which ${i})" == "" ];
		then
			echo "FATAL: you must install \"${i}\"...";
			return 1;
		fi
	done

	return 0;
}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
if [ ! -e "${APP}" ];
then
	echo "ERROR: make it";
	exit 1;
fi


check_prog "cat echo rm";
if [ "${?}" != "0" ];
then
	exit 1;
fi


test_it;


echo "ok, test passed";
exit 0;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
