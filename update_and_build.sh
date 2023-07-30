if [ "$#" -eq 0 ]; then
	versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
	eval "set -- $versions"
fi
for version; do
	export version
    rm -rf $version
    mkdir $version
    variantsUbuntu="$(jq -r '.[env.version].ubuntu' versions.json)"
    for variantsUbuntu in "${variantsUbuntu[@]}"; do
		export variantsUbuntu
        mkdir $version/ubuntu-$variantsUbuntu

        cp Dockerfile.ubuntu.template $version/ubuntu-$variantsUbuntu/Dockerfile
        cp ubuntu-docker-entrypoint.sh $version/ubuntu-$variantsUbuntu/docker-entrypoint.sh
        docker build  -t klemensgalus/lazy-terraform:$version-ubuntu$variantsUbuntu \
            --build-arg ANSIBLE_VERSION=$version \
            --build-arg variant=$variantsUbuntu \
            -f ./$version/ubuntu-$variantsUbuntu/Dockerfile ./$version/ubuntu-$variantsUbuntu
        
        docker push klemensgalus/lazy-terraform:$version-ubuntu$variantsUbuntu 
    done
    # variantsAlpine="$(jq -r '.[env.version].alpine' versions.json)"
    # for variantsAlpine in "${variantsAlpine[@]}"; do
	# 	export variantsAlpine
    #     mkdir $version/alpine-$variantsAlpine

    #     cp Dockerfile.alpine.template $version/alpine-$variantsAlpine/Dockerfile
    #     cp alpine-docker-entrypoint.sh $version/alpine-$variantsAlpine/docker-entrypoint.sh
    #     # docker build -t klemensgalus/lazy-ansible:$version-alpine$variantsAlpine \
    #     #     --build-arg ANSIBLE_VERSION=$version \
    #     #     --build-arg variant=$variantsAlpine \
    #     #     -f ./$version/alpine-$variantsAlpine/Dockerfile ./$version/alpine-$variantsAlpine
        
    #     # docker push klemensgalus/lazy-ansible:$version-alpine$variantsAlpine 
    # done

    # docker system prune --all --force
done

