//
//  ContentView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
	let music: Music
	@State private var count = 0
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
		ScrollView(showsIndicators: false) {
			VStack(alignment: .center) {
				Text(music.title)
					.imageScale(.large)
					.foregroundColor(.accentColor)
				ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, row in
					Text(row)
						.font(.title)
						.foregroundColor(index == count ? .red : .black)
						.fontDesign(.rounded)
						.fontWeight(.heavy)
						.multilineTextAlignment(.center)
						.padding(.vertical, 7)
				}
			}
			.padding()
		}
		.onReceive(timer) { _ in
			if count < music.lyrics.count - 1 {
				count += 1
			} else {
				count = 0
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(music: .musicSample)

    }
}


struct Music: Identifiable, Hashable {
	var id: String { title }
	let title: String
	let lyrics: [String]
}

extension Music {
	static let musicSample: Music = Music(
		title: "The Real Slim Shady",
		lyrics:
				[
					"May I have your attention, please ?",
					"May I have your attention, please ?\n Will the real Slim Shady please stand up ?",
					"I repeat, will the real Slim Shady please stand up ?\n We're gonna have a problem here...",
					"For I have your attention, please ?",
					"May I have your attention, please ?\n Will the real Slim Shady please stand up ?",
					"I repeat, will the real Slim Shady please stand up ?\n We're gonna have a problem here...",
				]
	)
}


