scriptencoding utf-8

function! unite#sources#moukoneyo#define()
	return s:source
endfunction


let s:source = {
\	"name" : "moukoneyo",
\	"description" : "moukoneyo",
\	"syntax" : "unitesource_moukoneyo",
\	"moukoneyo_counter" : 0,
\	"hooks" : {},
\	"moukoneyo_anim_data" : [
\	[
\   "                                               ",
\   "              ┏━┓                           ",
\   "              ┃も┃                           ",
\   "              ┃う┃                           ",
\   "              ┃来┃                           ",
\   "              ┃ね┃                           ",
\   "              ┃ぇ┃                           ",
\   "              ┃よ┃                           ",
\   "              ┃!!┃                           ",
\   "プン          ┣━┛      バカ                 ",
\   "(Д´ )    ヽ(`Д´)ノヽ(`Д´)ノヽ(`Д´)ノ   ",
\   " U┌/　）□－￣￣￣|－￣￣￣|＝|￣￣￣|        ",
\   "◎┗<━◎     ￣◎￣    ￣◎￣      ￣◎￣ ～～"
\	],
\	[
\   "                                               ",
\   "              ┏━┓                           ",
\   "              ┃も┃                           ",
\   "              ┃う┃                           ",
\   "              ┃来┃                           ",
\   "              ┃ね┃                           ",
\   "              ┃ぇ┃                           ",
\   "              ┃よ┃                           ",
\   "              ┃!!┃                           ",
\   "    プン      ┣━┛                ゴルァ     ",
\   "(Д´ )    ヽ(`Д´)ノヽ(`Д´)ノヽ(`Д´)ノ   ",
\   " U┌/　）□－￣￣￣|－￣￣￣|＝|￣￣￣|        ",
\   "◎┗<━◎     ￣◎￣    ￣◎￣      ￣◎￣ ～～"
\	],
\]
\}

function! s:source.async_gather_candidates(args, context)
	let a:context.source.unite__cached_candidates = []

	let result = deepcopy(self.moukoneyo_anim_data[(self.moukoneyo_counter/6)%len(self.moukoneyo_anim_data)])
	let width = winwidth("%")
	if self.moukoneyo_counter < len(result[0]) + width +5
		let self.moukoneyo_counter +=1
	else
		let self.moukoneyo_counter = 0
	endif
	let space = join(map(range(width), "' '"), "")

	return map(result, '{"word" : (space.v:val)[self.moukoneyo_counter:self.moukoneyo_counter+width-10], "dummy" : 1}')
endfunction


