
DESCRIPTION_DIR=./makeiso
TARGET_DIR=${DESCRIPTION_DIR}/output


build: makedir
	sudo kiwi-ng system build \
	--description ${DESCRIPTION_DIR} \
	--target-dir ${TARGET_DIR} 

makedir: clean
	mkdir ${DESCRIPTION_DIR}
	cp -p ./*.sh ${DESCRIPTION_DIR}/.
	cp -p ./*.kiwi ${DESCRIPTION_DIR}/.
	cp -rp ./root ${DESCRIPTION_DIR}/.

clean:
	sudo rm -rf ${DESCRIPTION_DIR}
