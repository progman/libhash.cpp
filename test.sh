#!/bin/bash
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 0.0.2
# Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
APP='./bin/hashsum';
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# run app
function run_app()
{
	local RESULT=0;
	local STDOUT;

	if [ "${FLAG_VALGRIND}" != "1" ];
	then
		STDOUT=$("${APP}" "${@}");
		RESULT="${?}";
	else
		local LOG_ID=0;
		local LOG_NAME;

		while true;
		do
			LOG_NAME=$(printf "valgrind.%03u\n" ${LOG_ID});

			if [ ! -e "${LOG_NAME}" ];
			then
				break;
			fi

			(( LOG_ID++ ));
		done

		STDOUT=$(valgrind --tool=memcheck --leak-check=yes --leak-check=full --show-reachable=yes --log-file="${LOG_NAME}" "${APP}" "${@}");
		RESULT="${?}";
	fi

	if [ "${STDOUT}" != "" ];
	then
		echo "${STDOUT}";
	fi

	return "${RESULT}";
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
function check()
{
	local HASH=${3};
	local RESULT=$(echo -n "${1}" | run_app -"${2}");
	if [ "${RESULT}" != "${HASH}" ];
	then
		echo "ERROR: result different for "${2}"...";
		echo "RESULT : ${RESULT}";
		echo "HASH   : ${HASH}";
		exit 1;
	fi
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# test
function test_it()
{
	check ''                                      'crc16'    'ffff';
	check 'Mom'                                   'crc16'    'ca0d';
	check 'Mom wash'                              'crc16'    '6afd';
	check 'Mom wash window frame'                 'crc16'    'fec0';
	check 'Mom wash window frame and Shura balls' 'crc16'    'c19a';

	check ''                                      'crc32'    '00000000';
	check 'Mom'                                   'crc32'    '5665ad0c';
	check 'Mom wash'                              'crc32'    '2769fdb4';
	check 'Mom wash window frame'                 'crc32'    '660246ce';
	check 'Mom wash window frame and Shura balls' 'crc32'    '18a5b32d';

	check ''                                      'md5'      'd41d8cd98f00b204e9800998ecf8427e';
	check 'Mom'                                   'md5'      'c988fa7c33ce43962b9803702b747a35';
	check 'Mom wash'                              'md5'      '497a01dabfa0f13649457d4773e184f9';
	check 'Mom wash window frame'                 'md5'      '399ce6cc07894050d7645aae84fab537';
	check 'Mom wash window frame and Shura balls' 'md5'      'e5794a4a922e4a5f438a229f8c89d008';

	check ''                                      'sha1'     'da39a3ee5e6b4b0d3255bfef95601890afd80709';
	check 'Mom'                                   'sha1'     '0967082f2aa15d0a0c0acc03ed8e64555840f63f';
	check 'Mom wash'                              'sha1'     '6d56273df975bbc6ef1eed1ec18368843647588c';
	check 'Mom wash window frame'                 'sha1'     '3fa55a9fbceb88f31faaa8f69b04a109ffddc3aa';
	check 'Mom wash window frame and Shura balls' 'sha1'     '95afdf31b23f267e97b88c88553cdd325d9f5b52';

	check ''                                      'sha256'   'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';
	check 'Mom'                                   'sha256'   'e65ccf65df25d3febdca240545e8682bb967ee59b7b522e6cefa071918a4291a';
	check 'Mom wash'                              'sha256'   '3638ad6508f0c8ffb89dee1d62c24e282760ef824124d82d75ad1e6c494ef315';
	check 'Mom wash window frame'                 'sha256'   '00e4aee92fbc4c1b67a5e76548ea9d463f3e79fa4452265da601a2f685cf274d';
	check 'Mom wash window frame and Shura balls' 'sha256'   '48b4fbcefc3826a1a06aa006f86b969b3a321fe75cd748f6c9a4783328549cf8';

	check ''                                      'sha512'   'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e';
	check 'Mom'                                   'sha512'   'd621f4ecdf2e7c464ab8035c86c2a74951c9562495d4ce34efcc8969661741096a7889a194135e58212edf6ccc835a222ef2679e78a87137769f5712c65d78a2';
	check 'Mom wash'                              'sha512'   'c1ee6ecf992504ebeb595ff223100f7818d37d8ef39ac26bc15de9bf6bb1fc0c5fb79291f17d485d8de761d553dc154bd1ea6d8e3c8d485bf1f1c92e3fea8403';
	check 'Mom wash window frame'                 'sha512'   '10fa3f1c5f7a1997c3e4de3c95cebb3cf8d9ea13a517b33a0c8dba56c3bb2fbeeb7d3fb0e77735a02acbf857e50c0ece65d07e8f8c7ad8bda05e95383fe0a028';
	check 'Mom wash window frame and Shura balls' 'sha512'   '7706747799340b879088d200ea5e8888882acae9cdd55f44c87fc23f7a39791bd1015aaf8a9ff5eaa8eee39ad7e97e9ec6b559c7aff3af794205a1fe05ee1063';

	check ''                                      'sha3_224' '6b4e03423667dbb73b6e15454f0eb1abd4597f9a1b078e3f5b5a6bc7';
	check 'Mom'                                   'sha3_224' '8b4bf6a255194499041a167652921946f03e3da47bcd510c350c59e6';
	check 'Mom wash'                              'sha3_224' 'f127d947e62eda25d28bea01064382120953344723a93b128d891a9b';
	check 'Mom wash window frame'                 'sha3_224' '46a91e6f2d387d0442fbcc61bf57f072c3ab5b01b4485fe0d7621722';
	check 'Mom wash window frame and Shura balls' 'sha3_224' '858f61c13d8c1d4e3996de46f37edbd30f1f2c5e0193cbb13869db21';

	check ''                                      'sha3_256' 'a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a';
	check 'Mom'                                   'sha3_256' '2aaec80780206f0ee165a909438f24f05050ea10cfc8713050047deefe44ca7d';
	check 'Mom wash'                              'sha3_256' 'd6e4a80b1469a77d57fbbdbd83a95cfd1c91a3998c1c00da34d8ff90e5e11736';
	check 'Mom wash window frame'                 'sha3_256' 'b251fb1669c98b322d21c961862f72705156ff25f327a676dd67236119f426d8';
	check 'Mom wash window frame and Shura balls' 'sha3_256' '3e3f1989d9e4036f1a78952136b7190c414eb969d57e8f1ea88fde66a2312034';

	check ''                                      'sha3_384' '0c63a75b845e4f7d01107d852e4c2485c51a50aaaa94fc61995e71bbee983a2ac3713831264adb47fb6bd1e058d5f004';
	check 'Mom'                                   'sha3_384' '2ee112dedbf09e11b4bd90d2fbf8bf23c6e216413cc1816c5ac7793651f8780a37e687082ee497be3248ef77769a904d';
	check 'Mom wash'                              'sha3_384' '129da9e997042e00aa6ddf40e9ea4a2f14ed04211e8ac65c1e6d951f5b6e8d758a6e73f9286d49493a217ca81df012b7';
	check 'Mom wash window frame'                 'sha3_384' '9126425d87f22e3490a29f765192a85c0147ce151fc088742105632d81b6ffb6dc8f26a56bc9060e443e5e0d9523778d';
	check 'Mom wash window frame and Shura balls' 'sha3_384' 'a74597174029ed00349c5c442dfb4df7604532f7c228dba7aef7550b1493870b3c5406d96e6f9027d28fd557e7f066df';

	check ''                                      'sha3_512' 'a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26';
	check 'Mom'                                   'sha3_512' '94feb3f4418bcc6da7a672224cbf22981d6197889328fe0aee1404b320b733609ae7957158b189b6588ecd3a10f6d3486a762b951d34266fe16161c1839a1436';
	check 'Mom wash'                              'sha3_512' '53a9075bc1b0e2739c79bba1623ed8c3ad0cd5e911f793bd75c3eaf24b32842b8cdb9d7ac82b7fedf426b5a326f66e50b409194c8c3a69138059d48bd3d879b2';
	check 'Mom wash window frame'                 'sha3_512' '4ef39895d6bdb9f36bb544fff74d7c50d2464ca9afce1cbbfe3ec810c69b3aad5de4cdd167d5dd4f8cf7fdf4e068897ca599603ed28f384e10a9cdb423d5ff7b';
	check 'Mom wash window frame and Shura balls' 'sha3_512' 'a6e48992e19a6e8e23ea7e13d09c97cf1ee4325fe26c7af3c686d49d2a0a2043dbaaf746c4d98907e0a23dbd28553997c06025a43e8a5f0eb78b6faa88171c3a';
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# check depends
function check_prog()
{
	for i in ${1};
	do
		if [ "$(command -v ${i})" == "" ];
		then
			echo "FATAL: you must install \"${i}\"...";
			return 1;
		fi
	done

	return 0;
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# general function
function main()
{
	if [ ! -e "${APP}" ];
	then
		echo "ERROR: make it";
		return 1;
	fi


	check_prog "cat echo rm";
	if [ "${?}" != "0" ];
	then
		return 1;
	fi


	test_it;


	echo "ok, test passed";
	return 0;
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
main "${@}";

exit "${?}";
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
