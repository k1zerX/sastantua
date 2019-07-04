/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sastantua.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kbatz <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/21 18:20:37 by kbatz             #+#    #+#             */
/*   Updated: 2019/07/04 19:13:16 by kbatz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_putchar(char c);

void	print_l(char c, int border)
{
	int i;

	i = -1;
	while (++i < border)
		ft_putchar(c);
}

void	print_m(int l, int kol)
{
	print_l(' ', l - kol - 1);
	ft_putchar('/');
	print_l('*', (kol << 1) + 1);
	ft_putchar('\\');
}

void	door(int door_size, int l, int kol)
{
	int j;
	int	buf;

	j = -1;
	while (++j < door_size)
	{
		print_l(' ', l - kol - j - 1);
		ft_putchar('/');
		buf = door_size >> 1;
		print_l('*', kol + j - buf);
		if ((j == buf) && (door_size > 3))
		{
			print_l('|', door_size - 2);
			ft_putchar('$');
			ft_putchar('|');
		}
		else
		{
			print_l('|', door_size);
		}
		print_l('*', kol + j - (door_size >> 1));
		ft_putchar('\\');
		ft_putchar('\n');
	}
}

void	top(int h, int l, int size, int door_size)
{
	int buf;
	int num;
	int kol;
	int j;
	int i;

	j = -1;
	while ((++j < size) && !(num == h - door_size))
	{
		i = -1;
		while (++i < 3 + j)
		{
			buf = j >> 1;
			num = (((j + 5) * j) >> 1) + i;
			kol = num + buf + buf * buf + (j & 1) * ((j + 1) >> 1) + j;
			if ((i == size + 2 - door_size) && (j == size - 1))
				break ;
			print_m(l, kol);
			ft_putchar('\n');
		}
	}
	door(door_size, l, kol);
}

void	sastantua(int size)
{
	int h;
	int l;
	int door_size;
	int buf;

	if (size > 0)
	{
		h = ((size + 5) * size) >> 1;
		buf = (size - 1) >> 1;
		door_size = (buf << 1) + 1;
		l = h + size - 1 + buf + buf * buf + ((size - 1) & 1) * (size >> 1);
		top(h, l, size, door_size);
	}
}
