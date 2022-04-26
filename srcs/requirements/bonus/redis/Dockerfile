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

RUN		apk update
RUN		apk add --no-cache --quiet --update redis

COPY	./tools/entrypoint.sh ./entrypoint.sh
RUN		chmod u+x ./entrypoint.sh

ENTRYPOINT [ "sh", "./entrypoint.sh"]
