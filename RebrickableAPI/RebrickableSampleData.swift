//
//  RebrickableSampleData.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/13/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation

struct RebrickableSampleData {
    static func getColors() -> Data {
        return toData(content: """
        {
          "count": 175,
          "next": "https://rebrickable.com/api/v3/lego/colors/?page=2",
          "previous": null,
          "results": [
            {
              "id": 0,
              "name": "Black",
              "rgb": "05131D",
              "is_trans": false,
              "external_ids": {
                "LDraw": {
                  "ext_ids": [
                    0
                  ],
                  "ext_descrs": [
                    [
                      "Black"
                    ]
                  ]
                }
              }
            }
            ]}
        """)
    }
    static func getColor(id: Int) -> Data {
        return toData(content: """
        {
          "id": \(id),
          "name": "Dark Turquoise",
          "rgb": "008F9B",
          "is_trans": false,
          "external_ids": {
            "LDraw": {
              "ext_ids": [
                3
              ],
              "ext_descrs": [
                [
                  "Dark_Turquoise"
                ]
              ]
            }
          }
        }
        """)
    }
    static func getPartCategories() -> Data {
        return toData(content: """
        {
          "count": 66,
          "next": null,
          "previous": null,
          "results": [
            {
              "id": 1,
              "name": "Baseplates",
              "part_count": 258
            },
            {
              "id": 2,
              "name": "Bricks Printed",
              "part_count": 933
            }
          ]
        }
        """)
    }
    static func getPartCategory(id: Int) -> Data {
        return toData(content: """
        {
          "id": \(id),
          "name": "Baseplates",
          "part_count": 258
        }
        """)
    }
    static func getParts(setNumber: String) -> Data {
        return toData(content: """
        {
          "count": 180,
          "next": "https://rebrickable.com/api/v3/lego/sets/6982-1/parts/?page=2",
          "previous": null,
          "results": [
            {
              "id": 908913,
              "inv_part_id": 908913,
              "part": {
                "part_num": "3004",
                "name": "Brick 1 x 2",
                "part_cat_id": 11,
                "part_url": "https://rebrickable.com/parts/3004/brick-1-x-2/",
                "part_img_url": "https://m.rebrickable.com/media/parts/elements/300426.jpg",
                "external_ids": {
                  "LDraw": [
                    "93792"
                  ]
                }
              },
              "color": {
                "id": 0,
                "name": "Black",
                "rgb": "05131D",
                "is_trans": false,
                "external_ids": {
                  "LDraw": {
                    "ext_ids": [
                      0
                    ],
                    "ext_descrs": [
                      [
                        "Black"
                      ]
                    ]
                  }
                }
              },
              "set_num": "6982-1",
              "quantity": 14,
              "is_spare": false,
              "element_id": "300426",
              "num_sets": 1316
            }]
        }
        """)
    }
    static func getPart(partNumber: String) -> Data {
        return toData(content: """
        {
          "part_num": "\(partNumber)",
          "name": "Brick 1 x 2",
          "part_cat_id": 11,
          "year_from": 1959,
          "year_to": 2019,
          "part_url": "https://rebrickable.com/parts/3004/brick-1-x-2/",
          "part_img_url": "https://m.rebrickable.com/media/parts/elements/300401.jpg",
          "prints": [
            "3004p0b",
            "3004p50"
          ],
          "molds": [],
          "alternates": [
            "3065",
            "bslot01a"
          ],
          "external_ids": {
            "LDraw": [
              "93792"
            ]
          }
        }
        """)
    }
    static func getSets(search: String, ordering: String, pageSize: Int, page: Int) -> Data {
        return toData(content: """
        {
          "count": 431,
          "next": "https://rebrickable.com/api/v3/lego/sets/?max_year=1997&min_year=1996&page=2",
          "previous": null,
          "results": [
            {
              "set_num": "1096-1",
              "name": "Race Buggy",
              "year": 1997,
              "theme_id": 82,
              "num_parts": 23,
              "set_img_url": "https://m.rebrickable.com/media/sets/1096-1.jpg",
              "set_url": "https://rebrickable.com/sets/1096-1/race-buggy/",
              "last_modified_dt": "2014-12-16T22:38:15.144634Z"
            }]
        }
        """)
    }
    static func getSetsByYear(minYear: Int, maxYear: Int, ordering: String, pageSize: Int, page: Int) -> Data {
        return toData(content: """
        {
          "count": 431,
          "next": "https://rebrickable.com/api/v3/lego/sets/?max_year=1997&min_year=1996&page=2",
          "previous": null,
          "results": [
            {
              "set_num": "1096-1",
              "name": "Race Buggy",
              "year": 1997,
              "theme_id": 82,
              "num_parts": 23,
              "set_img_url": "https://m.rebrickable.com/media/sets/1096-1.jpg",
              "set_url": "https://rebrickable.com/sets/1096-1/race-buggy/",
              "last_modified_dt": "2014-12-16T22:38:15.144634Z"
            }]
        }
        """)
    }
    static func getSetsByTheme(themeId: Int, ordering: String, pageSize: Int, page: Int) -> Data {
        return toData(content: """
        {
          "count": 431,
          "next": "https://rebrickable.com/api/v3/lego/sets/?max_year=1997&min_year=1996&page=2",
          "previous": null,
          "results": [
            {
              "set_num": "1096-1",
              "name": "Race Buggy",
              "year": 1997,
              "theme_id": \(themeId),
              "num_parts": 23,
              "set_img_url": "https://m.rebrickable.com/media/sets/1096-1.jpg",
              "set_url": "https://rebrickable.com/sets/1096-1/race-buggy/",
              "last_modified_dt": "2014-12-16T22:38:15.144634Z"
            }]
        }
        """)
    }
    static func getThemes() -> Data {
        return toData(content: """
        {
          "count": 667,
          "next": "https://rebrickable.com/api/v3/lego/themes/?page=2",
          "previous": null,
          "results": [
            {
              "id": 1,
              "parent_id": null,
              "name": "Technic"
            },
            {
              "id": 2,
              "parent_id": 1,
              "name": "Arctic Technic"
            }
          ]
        }
        """)
    }
    static func getTheme(id: Int) -> Data {
        return toData(content: """
        {
          "id": 1,
          "parent_id": null,
          "name": "Technic"
        }
        """)
    }
    
    static func toData(content: String) -> Data {
        return content.data(using: String.Encoding.utf8)!
    }
}
