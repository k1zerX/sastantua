/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kbatz <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/07/04 18:33:14 by kbatz             #+#    #+#             */
/*   Updated: 2019/07/04 18:39:20 by kbatz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>

void	sastantua(int size);

int		ft_putchar(char c)
{
	write(1, &c, 1);
	return (0);
}

int		main(int ac, char *av[])
{
	if (ac == 2)
		sastantua(atoi(av[1]));
	return (0);
}
