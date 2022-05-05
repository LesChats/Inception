# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaudot <abaudot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/25 17:46:58 by abaudot           #+#    #+#              #
#    Updated: 2022/04/25 17:49:16 by abaudot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN		apk update && apk upgrade && apk add --no-cache -q -u \
		redis

COPY		./tools/entrypoint.sh /tmp/entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh"]
