docker run -d --name node_exporter \
	--restart=always \
	--net="host" --pid="host" \
	-v "/proc:/host/proc:ro" \
	-v "/sys:/host/sys:ro" \
	-v "/:/rootfs:ro" \
	prom/node-exporter \
	--path.procfs=/host/proc \
	--path.rootfs=/rootfs \
	--path.sysfs=/host/sys \
	--collector.filesystem.ignored-mount-points='^/(sys|proc|dev|host|etc)($$|/)'