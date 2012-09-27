## Jump Line with Lower 2 Digits

At first, map `<Plug>(warp_lower2digits_trigger)` to any keys.

    nmap m <Plug>(warp_lower2digits_trigger)

Now, you can jump line using lower 2 digits of a line number.
Additional, your hands need not leave a home position because
you don't type number keys.

In this plugin, `asdfghjkl;` is mapping to `1234567890`.

I'll show some examples.


- When a cursor is on line 100, and you type `mfg`, you will jump to line 145.
- When 

<table>
<tr>
<th>before</th><th>your</th><th>after</th>
</tr>
<tr>
<th>line num</th><th>input</th><th>line num</th>
</tr>
<tr>
<td>100</td><td>mfg</td><td>145</td>
<td>100</td><td>mk;</td><td>180</td>
</tr>
</table>
