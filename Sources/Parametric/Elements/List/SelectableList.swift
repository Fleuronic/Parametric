// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI

public struct SelectableList<Item: Hashable>: View {
	fileprivate let items: [Item]
	fileprivate let text: (Item) -> String
	fileprivate let detailText: ((Item) -> String)?
	fileprivate let canSelectItem: (Item) -> Bool
	fileprivate let itemSelected: (Item) -> Void
	fileprivate let isLoading: Bool

	@State private var selectedItem: Item?

	public var body: some View {
		if isLoading {
			List { LoadingRow() }
		} else {
			List(
				items,
				id: \.self,
				selection: .init(
					get: { selectedItem },
					set: { item in
						selectedItem = item
						item.map(itemSelected)
					}
				)
			) { item in
				VStack(alignment: .leading) {
					Text(text(item))
						.font(.headline)
					if let detailText {
						Text(detailText(item))
							.font(.subheadline)
					}
				}
			}
		}
	}
}

// MARK: -
public extension List where Content == AnyView {
	static func content(
		items: [SelectionValue],
		text: @escaping (SelectionValue) -> String,
		detailText: ((SelectionValue) -> String)? = nil,
		canSelectItem: @escaping (SelectionValue) -> Bool,
		itemSelected: @escaping (SelectionValue) -> Void,
		isLoading: Bool = false
	) -> SelectableList<SelectionValue> {
		.init(
			items: items,
			text: text,
			detailText: detailText,
			canSelectItem: canSelectItem,
			itemSelected: itemSelected,
			isLoading: isLoading
		)
	}
}
