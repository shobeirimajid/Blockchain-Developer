// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;
//pragma solidity >= 0.6.0;
//pragma solidity >= 0.6.0 <=0.8.10;

contract Hello {

    /// 1- State Variables - متغیرهای حالت  ///
    // متغیرهای حالت روی بلاکچین ذخیره می شوند
    // تعداد و اندازه این متغیرها روی هزینه گس دپلوی کانترکت تاثیر مستقیم دارد
    string public helloStr;

    /// 2- Functions - توابع  ///

    // Constructor - سازنده
    constructor() {
        // دستورات خاصی که فقط یک بار در مرحله دپلوی کانترکت باید اجرا شوند
        // مثل گرفتن آدرس مالک یا همان دپلوی کننده کانترکت
        // یا مثل تعین تعداد اولیه توکن

        // مقدادهی اولیه متغیرها
        helloStr = "Hello World!";
    }

    // فانکن های دیگر
    // user-defined functions
}


contract myContract {

}


// انواع لایسنس
// https://spdx.org/licenses/


// مستندات آموزش سالیدیت
// https://docs.soliditylang.org/


// انواع کامنت در سالیدیتی

// کامنت تک خطی

/* 
    کامنت چند خطی
    خط 1
    خط 2
    ...
*/


/*
    Access Modifier - سطح دسترسی
        public : از داخل و خارج اسمارت کانترکت قابل مشاهده است
        private : دسترسی فقط از داخل خود کانترکت
        internal : دسترسی از خود کانترکت و کانترکت های فرزند
        external : این فانکشن فقط از بیرون کانترکت قابل استفاده است - فقط برای فانکشن ها
*/


/*
    مراحل توسعه یک اسمارت کانترکت

        1- نوشتن کد سالیدیتی کانترکت
        2- کامپایل
        3- دپلوی
*/


/*
    خروجی کامپایل یک کانترکت
        ByteCode
        ABI

    خروجی دپلوی یک کانترکت
        Address
*/


/*
    ABI:

    [
        {
            "inputs": [],
            "stateMutability": "nonpayable",
            "type": "constructor"
        },
        {
            "inputs": [],
            "name": "helloStr",
            "outputs": [
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        }
    ]
*/


/*
    ByteCode:

    {
	"functionDebugData": {
		"@_13": {
			"entryPoint": null,
			"id": 13,
			"parameterSlots": 0,
			"returnSlots": 0
		},
		"array_dataslot_t_string_storage": {
			"entryPoint": 245,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"array_length_t_string_memory_ptr": {
			"entryPoint": 91,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"clean_up_bytearray_end_slots_t_string_storage": {
			"entryPoint": 542,
			"id": null,
			"parameterSlots": 3,
			"returnSlots": 0
		},
		"cleanup_t_uint256": {
			"entryPoint": 377,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"clear_storage_range_t_bytes1": {
			"entryPoint": 507,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 0
		},
		"convert_t_uint256_to_t_uint256": {
			"entryPoint": 397,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage": {
			"entryPoint": 683,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 0
		},
		"divide_by_32_ceil": {
			"entryPoint": 266,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"extract_byte_array_length": {
			"entryPoint": 196,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"extract_used_part_and_set_length_of_short_byte_array": {
			"entryPoint": 655,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 1
		},
		"identity": {
			"entryPoint": 387,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"mask_bytes_dynamic": {
			"entryPoint": 625,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 1
		},
		"panic_error_0x22": {
			"entryPoint": 149,
			"id": null,
			"parameterSlots": 0,
			"returnSlots": 0
		},
		"panic_error_0x41": {
			"entryPoint": 102,
			"id": null,
			"parameterSlots": 0,
			"returnSlots": 0
		},
		"prepare_store_t_uint256": {
			"entryPoint": 431,
			"id": null,
			"parameterSlots": 1,
			"returnSlots": 1
		},
		"shift_left_dynamic": {
			"entryPoint": 282,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 1
		},
		"shift_right_unsigned_dynamic": {
			"entryPoint": 612,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 1
		},
		"storage_set_to_zero_t_uint256": {
			"entryPoint": 483,
			"id": null,
			"parameterSlots": 2,
			"returnSlots": 0
		},
		"update_byte_slice_dynamic32": {
			"entryPoint": 295,
			"id": null,
			"parameterSlots": 3,
			"returnSlots": 1
		},
		"update_storage_value_t_uint256_to_t_uint256": {
			"entryPoint": 441,
			"id": null,
			"parameterSlots": 3,
			"returnSlots": 0
		},
		"zero_value_for_split_t_uint256": {
			"entryPoint": 478,
			"id": null,
			"parameterSlots": 0,
			"returnSlots": 1
		}
	},
	"generatedSources": [
		{
			"ast": {
				"nodeType": "YulBlock",
				"src": "0:5231:1",
				"statements": [
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "66:40:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "77:22:1",
									"value": {
										"arguments": [
											{
												"name": "value",
												"nodeType": "YulIdentifier",
												"src": "93:5:1"
											}
										],
										"functionName": {
											"name": "mload",
											"nodeType": "YulIdentifier",
											"src": "87:5:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "87:12:1"
									},
									"variableNames": [
										{
											"name": "length",
											"nodeType": "YulIdentifier",
											"src": "77:6:1"
										}
									]
								}
							]
						},
						"name": "array_length_t_string_memory_ptr",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "49:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "length",
								"nodeType": "YulTypedName",
								"src": "59:6:1",
								"type": ""
							}
						],
						"src": "7:99:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "140:152:1",
							"statements": [
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "157:1:1",
												"type": "",
												"value": "0"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "160:77:1",
												"type": "",
												"value": "35408467139433450592217433187231851964531694900788300625387963629091585785856"
											}
										],
										"functionName": {
											"name": "mstore",
											"nodeType": "YulIdentifier",
											"src": "150:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "150:88:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "150:88:1"
								},
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "254:1:1",
												"type": "",
												"value": "4"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "257:4:1",
												"type": "",
												"value": "0x41"
											}
										],
										"functionName": {
											"name": "mstore",
											"nodeType": "YulIdentifier",
											"src": "247:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "247:15:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "247:15:1"
								},
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "278:1:1",
												"type": "",
												"value": "0"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "281:4:1",
												"type": "",
												"value": "0x24"
											}
										],
										"functionName": {
											"name": "revert",
											"nodeType": "YulIdentifier",
											"src": "271:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "271:15:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "271:15:1"
								}
							]
						},
						"name": "panic_error_0x41",
						"nodeType": "YulFunctionDefinition",
						"src": "112:180:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "326:152:1",
							"statements": [
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "343:1:1",
												"type": "",
												"value": "0"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "346:77:1",
												"type": "",
												"value": "35408467139433450592217433187231851964531694900788300625387963629091585785856"
											}
										],
										"functionName": {
											"name": "mstore",
											"nodeType": "YulIdentifier",
											"src": "336:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "336:88:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "336:88:1"
								},
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "440:1:1",
												"type": "",
												"value": "4"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "443:4:1",
												"type": "",
												"value": "0x22"
											}
										],
										"functionName": {
											"name": "mstore",
											"nodeType": "YulIdentifier",
											"src": "433:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "433:15:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "433:15:1"
								},
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "464:1:1",
												"type": "",
												"value": "0"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "467:4:1",
												"type": "",
												"value": "0x24"
											}
										],
										"functionName": {
											"name": "revert",
											"nodeType": "YulIdentifier",
											"src": "457:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "457:15:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "457:15:1"
								}
							]
						},
						"name": "panic_error_0x22",
						"nodeType": "YulFunctionDefinition",
						"src": "298:180:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "535:269:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "545:22:1",
									"value": {
										"arguments": [
											{
												"name": "data",
												"nodeType": "YulIdentifier",
												"src": "559:4:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "565:1:1",
												"type": "",
												"value": "2"
											}
										],
										"functionName": {
											"name": "div",
											"nodeType": "YulIdentifier",
											"src": "555:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "555:12:1"
									},
									"variableNames": [
										{
											"name": "length",
											"nodeType": "YulIdentifier",
											"src": "545:6:1"
										}
									]
								},
								{
									"nodeType": "YulVariableDeclaration",
									"src": "576:38:1",
									"value": {
										"arguments": [
											{
												"name": "data",
												"nodeType": "YulIdentifier",
												"src": "606:4:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "612:1:1",
												"type": "",
												"value": "1"
											}
										],
										"functionName": {
											"name": "and",
											"nodeType": "YulIdentifier",
											"src": "602:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "602:12:1"
									},
									"variables": [
										{
											"name": "outOfPlaceEncoding",
											"nodeType": "YulTypedName",
											"src": "580:18:1",
											"type": ""
										}
									]
								},
								{
									"body": {
										"nodeType": "YulBlock",
										"src": "653:51:1",
										"statements": [
											{
												"nodeType": "YulAssignment",
												"src": "667:27:1",
												"value": {
													"arguments": [
														{
															"name": "length",
															"nodeType": "YulIdentifier",
															"src": "681:6:1"
														},
														{
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "689:4:1",
															"type": "",
															"value": "0x7f"
														}
													],
													"functionName": {
														"name": "and",
														"nodeType": "YulIdentifier",
														"src": "677:3:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "677:17:1"
												},
												"variableNames": [
													{
														"name": "length",
														"nodeType": "YulIdentifier",
														"src": "667:6:1"
													}
												]
											}
										]
									},
									"condition": {
										"arguments": [
											{
												"name": "outOfPlaceEncoding",
												"nodeType": "YulIdentifier",
												"src": "633:18:1"
											}
										],
										"functionName": {
											"name": "iszero",
											"nodeType": "YulIdentifier",
											"src": "626:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "626:26:1"
									},
									"nodeType": "YulIf",
									"src": "623:81:1"
								},
								{
									"body": {
										"nodeType": "YulBlock",
										"src": "756:42:1",
										"statements": [
											{
												"expression": {
													"arguments": [],
													"functionName": {
														"name": "panic_error_0x22",
														"nodeType": "YulIdentifier",
														"src": "770:16:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "770:18:1"
												},
												"nodeType": "YulExpressionStatement",
												"src": "770:18:1"
											}
										]
									},
									"condition": {
										"arguments": [
											{
												"name": "outOfPlaceEncoding",
												"nodeType": "YulIdentifier",
												"src": "720:18:1"
											},
											{
												"arguments": [
													{
														"name": "length",
														"nodeType": "YulIdentifier",
														"src": "743:6:1"
													},
													{
														"kind": "number",
														"nodeType": "YulLiteral",
														"src": "751:2:1",
														"type": "",
														"value": "32"
													}
												],
												"functionName": {
													"name": "lt",
													"nodeType": "YulIdentifier",
													"src": "740:2:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "740:14:1"
											}
										],
										"functionName": {
											"name": "eq",
											"nodeType": "YulIdentifier",
											"src": "717:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "717:38:1"
									},
									"nodeType": "YulIf",
									"src": "714:84:1"
								}
							]
						},
						"name": "extract_byte_array_length",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "data",
								"nodeType": "YulTypedName",
								"src": "519:4:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "length",
								"nodeType": "YulTypedName",
								"src": "528:6:1",
								"type": ""
							}
						],
						"src": "484:320:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "864:87:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "874:11:1",
									"value": {
										"name": "ptr",
										"nodeType": "YulIdentifier",
										"src": "882:3:1"
									},
									"variableNames": [
										{
											"name": "data",
											"nodeType": "YulIdentifier",
											"src": "874:4:1"
										}
									]
								},
								{
									"expression": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "902:1:1",
												"type": "",
												"value": "0"
											},
											{
												"name": "ptr",
												"nodeType": "YulIdentifier",
												"src": "905:3:1"
											}
										],
										"functionName": {
											"name": "mstore",
											"nodeType": "YulIdentifier",
											"src": "895:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "895:14:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "895:14:1"
								},
								{
									"nodeType": "YulAssignment",
									"src": "918:26:1",
									"value": {
										"arguments": [
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "936:1:1",
												"type": "",
												"value": "0"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "939:4:1",
												"type": "",
												"value": "0x20"
											}
										],
										"functionName": {
											"name": "keccak256",
											"nodeType": "YulIdentifier",
											"src": "926:9:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "926:18:1"
									},
									"variableNames": [
										{
											"name": "data",
											"nodeType": "YulIdentifier",
											"src": "918:4:1"
										}
									]
								}
							]
						},
						"name": "array_dataslot_t_string_storage",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "ptr",
								"nodeType": "YulTypedName",
								"src": "851:3:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "data",
								"nodeType": "YulTypedName",
								"src": "859:4:1",
								"type": ""
							}
						],
						"src": "810:141:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1001:49:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1011:33:1",
									"value": {
										"arguments": [
											{
												"arguments": [
													{
														"name": "value",
														"nodeType": "YulIdentifier",
														"src": "1029:5:1"
													},
													{
														"kind": "number",
														"nodeType": "YulLiteral",
														"src": "1036:2:1",
														"type": "",
														"value": "31"
													}
												],
												"functionName": {
													"name": "add",
													"nodeType": "YulIdentifier",
													"src": "1025:3:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "1025:14:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "1041:2:1",
												"type": "",
												"value": "32"
											}
										],
										"functionName": {
											"name": "div",
											"nodeType": "YulIdentifier",
											"src": "1021:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1021:23:1"
									},
									"variableNames": [
										{
											"name": "result",
											"nodeType": "YulIdentifier",
											"src": "1011:6:1"
										}
									]
								}
							]
						},
						"name": "divide_by_32_ceil",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "984:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "result",
								"nodeType": "YulTypedName",
								"src": "994:6:1",
								"type": ""
							}
						],
						"src": "957:93:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1109:54:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1119:37:1",
									"value": {
										"arguments": [
											{
												"name": "bits",
												"nodeType": "YulIdentifier",
												"src": "1144:4:1"
											},
											{
												"name": "value",
												"nodeType": "YulIdentifier",
												"src": "1150:5:1"
											}
										],
										"functionName": {
											"name": "shl",
											"nodeType": "YulIdentifier",
											"src": "1140:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1140:16:1"
									},
									"variableNames": [
										{
											"name": "newValue",
											"nodeType": "YulIdentifier",
											"src": "1119:8:1"
										}
									]
								}
							]
						},
						"name": "shift_left_dynamic",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "bits",
								"nodeType": "YulTypedName",
								"src": "1084:4:1",
								"type": ""
							},
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1090:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "newValue",
								"nodeType": "YulTypedName",
								"src": "1100:8:1",
								"type": ""
							}
						],
						"src": "1056:107:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1245:317:1",
							"statements": [
								{
									"nodeType": "YulVariableDeclaration",
									"src": "1255:35:1",
									"value": {
										"arguments": [
											{
												"name": "shiftBytes",
												"nodeType": "YulIdentifier",
												"src": "1276:10:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "1288:1:1",
												"type": "",
												"value": "8"
											}
										],
										"functionName": {
											"name": "mul",
											"nodeType": "YulIdentifier",
											"src": "1272:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1272:18:1"
									},
									"variables": [
										{
											"name": "shiftBits",
											"nodeType": "YulTypedName",
											"src": "1259:9:1",
											"type": ""
										}
									]
								},
								{
									"nodeType": "YulVariableDeclaration",
									"src": "1299:109:1",
									"value": {
										"arguments": [
											{
												"name": "shiftBits",
												"nodeType": "YulIdentifier",
												"src": "1330:9:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "1341:66:1",
												"type": "",
												"value": "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
											}
										],
										"functionName": {
											"name": "shift_left_dynamic",
											"nodeType": "YulIdentifier",
											"src": "1311:18:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1311:97:1"
									},
									"variables": [
										{
											"name": "mask",
											"nodeType": "YulTypedName",
											"src": "1303:4:1",
											"type": ""
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "1417:51:1",
									"value": {
										"arguments": [
											{
												"name": "shiftBits",
												"nodeType": "YulIdentifier",
												"src": "1448:9:1"
											},
											{
												"name": "toInsert",
												"nodeType": "YulIdentifier",
												"src": "1459:8:1"
											}
										],
										"functionName": {
											"name": "shift_left_dynamic",
											"nodeType": "YulIdentifier",
											"src": "1429:18:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1429:39:1"
									},
									"variableNames": [
										{
											"name": "toInsert",
											"nodeType": "YulIdentifier",
											"src": "1417:8:1"
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "1477:30:1",
									"value": {
										"arguments": [
											{
												"name": "value",
												"nodeType": "YulIdentifier",
												"src": "1490:5:1"
											},
											{
												"arguments": [
													{
														"name": "mask",
														"nodeType": "YulIdentifier",
														"src": "1501:4:1"
													}
												],
												"functionName": {
													"name": "not",
													"nodeType": "YulIdentifier",
													"src": "1497:3:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "1497:9:1"
											}
										],
										"functionName": {
											"name": "and",
											"nodeType": "YulIdentifier",
											"src": "1486:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1486:21:1"
									},
									"variableNames": [
										{
											"name": "value",
											"nodeType": "YulIdentifier",
											"src": "1477:5:1"
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "1516:40:1",
									"value": {
										"arguments": [
											{
												"name": "value",
												"nodeType": "YulIdentifier",
												"src": "1529:5:1"
											},
											{
												"arguments": [
													{
														"name": "toInsert",
														"nodeType": "YulIdentifier",
														"src": "1540:8:1"
													},
													{
														"name": "mask",
														"nodeType": "YulIdentifier",
														"src": "1550:4:1"
													}
												],
												"functionName": {
													"name": "and",
													"nodeType": "YulIdentifier",
													"src": "1536:3:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "1536:19:1"
											}
										],
										"functionName": {
											"name": "or",
											"nodeType": "YulIdentifier",
											"src": "1526:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1526:30:1"
									},
									"variableNames": [
										{
											"name": "result",
											"nodeType": "YulIdentifier",
											"src": "1516:6:1"
										}
									]
								}
							]
						},
						"name": "update_byte_slice_dynamic32",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1206:5:1",
								"type": ""
							},
							{
								"name": "shiftBytes",
								"nodeType": "YulTypedName",
								"src": "1213:10:1",
								"type": ""
							},
							{
								"name": "toInsert",
								"nodeType": "YulTypedName",
								"src": "1225:8:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "result",
								"nodeType": "YulTypedName",
								"src": "1238:6:1",
								"type": ""
							}
						],
						"src": "1169:393:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1613:32:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1623:16:1",
									"value": {
										"name": "value",
										"nodeType": "YulIdentifier",
										"src": "1634:5:1"
									},
									"variableNames": [
										{
											"name": "cleaned",
											"nodeType": "YulIdentifier",
											"src": "1623:7:1"
										}
									]
								}
							]
						},
						"name": "cleanup_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1595:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "cleaned",
								"nodeType": "YulTypedName",
								"src": "1605:7:1",
								"type": ""
							}
						],
						"src": "1568:77:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1683:28:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1693:12:1",
									"value": {
										"name": "value",
										"nodeType": "YulIdentifier",
										"src": "1700:5:1"
									},
									"variableNames": [
										{
											"name": "ret",
											"nodeType": "YulIdentifier",
											"src": "1693:3:1"
										}
									]
								}
							]
						},
						"name": "identity",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1669:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "ret",
								"nodeType": "YulTypedName",
								"src": "1679:3:1",
								"type": ""
							}
						],
						"src": "1651:60:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1777:82:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1787:66:1",
									"value": {
										"arguments": [
											{
												"arguments": [
													{
														"arguments": [
															{
																"name": "value",
																"nodeType": "YulIdentifier",
																"src": "1845:5:1"
															}
														],
														"functionName": {
															"name": "cleanup_t_uint256",
															"nodeType": "YulIdentifier",
															"src": "1827:17:1"
														},
														"nodeType": "YulFunctionCall",
														"src": "1827:24:1"
													}
												],
												"functionName": {
													"name": "identity",
													"nodeType": "YulIdentifier",
													"src": "1818:8:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "1818:34:1"
											}
										],
										"functionName": {
											"name": "cleanup_t_uint256",
											"nodeType": "YulIdentifier",
											"src": "1800:17:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "1800:53:1"
									},
									"variableNames": [
										{
											"name": "converted",
											"nodeType": "YulIdentifier",
											"src": "1787:9:1"
										}
									]
								}
							]
						},
						"name": "convert_t_uint256_to_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1757:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "converted",
								"nodeType": "YulTypedName",
								"src": "1767:9:1",
								"type": ""
							}
						],
						"src": "1717:142:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "1912:28:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "1922:12:1",
									"value": {
										"name": "value",
										"nodeType": "YulIdentifier",
										"src": "1929:5:1"
									},
									"variableNames": [
										{
											"name": "ret",
											"nodeType": "YulIdentifier",
											"src": "1922:3:1"
										}
									]
								}
							]
						},
						"name": "prepare_store_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "1898:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "ret",
								"nodeType": "YulTypedName",
								"src": "1908:3:1",
								"type": ""
							}
						],
						"src": "1865:75:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "2022:193:1",
							"statements": [
								{
									"nodeType": "YulVariableDeclaration",
									"src": "2032:63:1",
									"value": {
										"arguments": [
											{
												"name": "value_0",
												"nodeType": "YulIdentifier",
												"src": "2087:7:1"
											}
										],
										"functionName": {
											"name": "convert_t_uint256_to_t_uint256",
											"nodeType": "YulIdentifier",
											"src": "2056:30:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2056:39:1"
									},
									"variables": [
										{
											"name": "convertedValue_0",
											"nodeType": "YulTypedName",
											"src": "2036:16:1",
											"type": ""
										}
									]
								},
								{
									"expression": {
										"arguments": [
											{
												"name": "slot",
												"nodeType": "YulIdentifier",
												"src": "2111:4:1"
											},
											{
												"arguments": [
													{
														"arguments": [
															{
																"name": "slot",
																"nodeType": "YulIdentifier",
																"src": "2151:4:1"
															}
														],
														"functionName": {
															"name": "sload",
															"nodeType": "YulIdentifier",
															"src": "2145:5:1"
														},
														"nodeType": "YulFunctionCall",
														"src": "2145:11:1"
													},
													{
														"name": "offset",
														"nodeType": "YulIdentifier",
														"src": "2158:6:1"
													},
													{
														"arguments": [
															{
																"name": "convertedValue_0",
																"nodeType": "YulIdentifier",
																"src": "2190:16:1"
															}
														],
														"functionName": {
															"name": "prepare_store_t_uint256",
															"nodeType": "YulIdentifier",
															"src": "2166:23:1"
														},
														"nodeType": "YulFunctionCall",
														"src": "2166:41:1"
													}
												],
												"functionName": {
													"name": "update_byte_slice_dynamic32",
													"nodeType": "YulIdentifier",
													"src": "2117:27:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "2117:91:1"
											}
										],
										"functionName": {
											"name": "sstore",
											"nodeType": "YulIdentifier",
											"src": "2104:6:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2104:105:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "2104:105:1"
								}
							]
						},
						"name": "update_storage_value_t_uint256_to_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "slot",
								"nodeType": "YulTypedName",
								"src": "1999:4:1",
								"type": ""
							},
							{
								"name": "offset",
								"nodeType": "YulTypedName",
								"src": "2005:6:1",
								"type": ""
							},
							{
								"name": "value_0",
								"nodeType": "YulTypedName",
								"src": "2013:7:1",
								"type": ""
							}
						],
						"src": "1946:269:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "2270:24:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "2280:8:1",
									"value": {
										"kind": "number",
										"nodeType": "YulLiteral",
										"src": "2287:1:1",
										"type": "",
										"value": "0"
									},
									"variableNames": [
										{
											"name": "ret",
											"nodeType": "YulIdentifier",
											"src": "2280:3:1"
										}
									]
								}
							]
						},
						"name": "zero_value_for_split_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"returnVariables": [
							{
								"name": "ret",
								"nodeType": "YulTypedName",
								"src": "2266:3:1",
								"type": ""
							}
						],
						"src": "2221:73:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "2353:136:1",
							"statements": [
								{
									"nodeType": "YulVariableDeclaration",
									"src": "2363:46:1",
									"value": {
										"arguments": [],
										"functionName": {
											"name": "zero_value_for_split_t_uint256",
											"nodeType": "YulIdentifier",
											"src": "2377:30:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2377:32:1"
									},
									"variables": [
										{
											"name": "zero_0",
											"nodeType": "YulTypedName",
											"src": "2367:6:1",
											"type": ""
										}
									]
								},
								{
									"expression": {
										"arguments": [
											{
												"name": "slot",
												"nodeType": "YulIdentifier",
												"src": "2462:4:1"
											},
											{
												"name": "offset",
												"nodeType": "YulIdentifier",
												"src": "2468:6:1"
											},
											{
												"name": "zero_0",
												"nodeType": "YulIdentifier",
												"src": "2476:6:1"
											}
										],
										"functionName": {
											"name": "update_storage_value_t_uint256_to_t_uint256",
											"nodeType": "YulIdentifier",
											"src": "2418:43:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2418:65:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "2418:65:1"
								}
							]
						},
						"name": "storage_set_to_zero_t_uint256",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "slot",
								"nodeType": "YulTypedName",
								"src": "2339:4:1",
								"type": ""
							},
							{
								"name": "offset",
								"nodeType": "YulTypedName",
								"src": "2345:6:1",
								"type": ""
							}
						],
						"src": "2300:189:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "2545:136:1",
							"statements": [
								{
									"body": {
										"nodeType": "YulBlock",
										"src": "2612:63:1",
										"statements": [
											{
												"expression": {
													"arguments": [
														{
															"name": "start",
															"nodeType": "YulIdentifier",
															"src": "2656:5:1"
														},
														{
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "2663:1:1",
															"type": "",
															"value": "0"
														}
													],
													"functionName": {
														"name": "storage_set_to_zero_t_uint256",
														"nodeType": "YulIdentifier",
														"src": "2626:29:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "2626:39:1"
												},
												"nodeType": "YulExpressionStatement",
												"src": "2626:39:1"
											}
										]
									},
									"condition": {
										"arguments": [
											{
												"name": "start",
												"nodeType": "YulIdentifier",
												"src": "2565:5:1"
											},
											{
												"name": "end",
												"nodeType": "YulIdentifier",
												"src": "2572:3:1"
											}
										],
										"functionName": {
											"name": "lt",
											"nodeType": "YulIdentifier",
											"src": "2562:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2562:14:1"
									},
									"nodeType": "YulForLoop",
									"post": {
										"nodeType": "YulBlock",
										"src": "2577:26:1",
										"statements": [
											{
												"nodeType": "YulAssignment",
												"src": "2579:22:1",
												"value": {
													"arguments": [
														{
															"name": "start",
															"nodeType": "YulIdentifier",
															"src": "2592:5:1"
														},
														{
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "2599:1:1",
															"type": "",
															"value": "1"
														}
													],
													"functionName": {
														"name": "add",
														"nodeType": "YulIdentifier",
														"src": "2588:3:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "2588:13:1"
												},
												"variableNames": [
													{
														"name": "start",
														"nodeType": "YulIdentifier",
														"src": "2579:5:1"
													}
												]
											}
										]
									},
									"pre": {
										"nodeType": "YulBlock",
										"src": "2559:2:1",
										"statements": []
									},
									"src": "2555:120:1"
								}
							]
						},
						"name": "clear_storage_range_t_bytes1",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "start",
								"nodeType": "YulTypedName",
								"src": "2533:5:1",
								"type": ""
							},
							{
								"name": "end",
								"nodeType": "YulTypedName",
								"src": "2540:3:1",
								"type": ""
							}
						],
						"src": "2495:186:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "2766:464:1",
							"statements": [
								{
									"body": {
										"nodeType": "YulBlock",
										"src": "2792:431:1",
										"statements": [
											{
												"nodeType": "YulVariableDeclaration",
												"src": "2806:54:1",
												"value": {
													"arguments": [
														{
															"name": "array",
															"nodeType": "YulIdentifier",
															"src": "2854:5:1"
														}
													],
													"functionName": {
														"name": "array_dataslot_t_string_storage",
														"nodeType": "YulIdentifier",
														"src": "2822:31:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "2822:38:1"
												},
												"variables": [
													{
														"name": "dataArea",
														"nodeType": "YulTypedName",
														"src": "2810:8:1",
														"type": ""
													}
												]
											},
											{
												"nodeType": "YulVariableDeclaration",
												"src": "2873:63:1",
												"value": {
													"arguments": [
														{
															"name": "dataArea",
															"nodeType": "YulIdentifier",
															"src": "2896:8:1"
														},
														{
															"arguments": [
																{
																	"name": "startIndex",
																	"nodeType": "YulIdentifier",
																	"src": "2924:10:1"
																}
															],
															"functionName": {
																"name": "divide_by_32_ceil",
																"nodeType": "YulIdentifier",
																"src": "2906:17:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "2906:29:1"
														}
													],
													"functionName": {
														"name": "add",
														"nodeType": "YulIdentifier",
														"src": "2892:3:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "2892:44:1"
												},
												"variables": [
													{
														"name": "deleteStart",
														"nodeType": "YulTypedName",
														"src": "2877:11:1",
														"type": ""
													}
												]
											},
											{
												"body": {
													"nodeType": "YulBlock",
													"src": "3093:27:1",
													"statements": [
														{
															"nodeType": "YulAssignment",
															"src": "3095:23:1",
															"value": {
																"name": "dataArea",
																"nodeType": "YulIdentifier",
																"src": "3110:8:1"
															},
															"variableNames": [
																{
																	"name": "deleteStart",
																	"nodeType": "YulIdentifier",
																	"src": "3095:11:1"
																}
															]
														}
													]
												},
												"condition": {
													"arguments": [
														{
															"name": "startIndex",
															"nodeType": "YulIdentifier",
															"src": "3077:10:1"
														},
														{
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "3089:2:1",
															"type": "",
															"value": "32"
														}
													],
													"functionName": {
														"name": "lt",
														"nodeType": "YulIdentifier",
														"src": "3074:2:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "3074:18:1"
												},
												"nodeType": "YulIf",
												"src": "3071:49:1"
											},
											{
												"expression": {
													"arguments": [
														{
															"name": "deleteStart",
															"nodeType": "YulIdentifier",
															"src": "3162:11:1"
														},
														{
															"arguments": [
																{
																	"name": "dataArea",
																	"nodeType": "YulIdentifier",
																	"src": "3179:8:1"
																},
																{
																	"arguments": [
																		{
																			"name": "len",
																			"nodeType": "YulIdentifier",
																			"src": "3207:3:1"
																		}
																	],
																	"functionName": {
																		"name": "divide_by_32_ceil",
																		"nodeType": "YulIdentifier",
																		"src": "3189:17:1"
																	},
																	"nodeType": "YulFunctionCall",
																	"src": "3189:22:1"
																}
															],
															"functionName": {
																"name": "add",
																"nodeType": "YulIdentifier",
																"src": "3175:3:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "3175:37:1"
														}
													],
													"functionName": {
														"name": "clear_storage_range_t_bytes1",
														"nodeType": "YulIdentifier",
														"src": "3133:28:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "3133:80:1"
												},
												"nodeType": "YulExpressionStatement",
												"src": "3133:80:1"
											}
										]
									},
									"condition": {
										"arguments": [
											{
												"name": "len",
												"nodeType": "YulIdentifier",
												"src": "2783:3:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "2788:2:1",
												"type": "",
												"value": "31"
											}
										],
										"functionName": {
											"name": "gt",
											"nodeType": "YulIdentifier",
											"src": "2780:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "2780:11:1"
									},
									"nodeType": "YulIf",
									"src": "2777:446:1"
								}
							]
						},
						"name": "clean_up_bytearray_end_slots_t_string_storage",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "array",
								"nodeType": "YulTypedName",
								"src": "2742:5:1",
								"type": ""
							},
							{
								"name": "len",
								"nodeType": "YulTypedName",
								"src": "2749:3:1",
								"type": ""
							},
							{
								"name": "startIndex",
								"nodeType": "YulTypedName",
								"src": "2754:10:1",
								"type": ""
							}
						],
						"src": "2687:543:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "3299:54:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "3309:37:1",
									"value": {
										"arguments": [
											{
												"name": "bits",
												"nodeType": "YulIdentifier",
												"src": "3334:4:1"
											},
											{
												"name": "value",
												"nodeType": "YulIdentifier",
												"src": "3340:5:1"
											}
										],
										"functionName": {
											"name": "shr",
											"nodeType": "YulIdentifier",
											"src": "3330:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3330:16:1"
									},
									"variableNames": [
										{
											"name": "newValue",
											"nodeType": "YulIdentifier",
											"src": "3309:8:1"
										}
									]
								}
							]
						},
						"name": "shift_right_unsigned_dynamic",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "bits",
								"nodeType": "YulTypedName",
								"src": "3274:4:1",
								"type": ""
							},
							{
								"name": "value",
								"nodeType": "YulTypedName",
								"src": "3280:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "newValue",
								"nodeType": "YulTypedName",
								"src": "3290:8:1",
								"type": ""
							}
						],
						"src": "3236:117:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "3410:118:1",
							"statements": [
								{
									"nodeType": "YulVariableDeclaration",
									"src": "3420:68:1",
									"value": {
										"arguments": [
											{
												"arguments": [
													{
														"arguments": [
															{
																"kind": "number",
																"nodeType": "YulLiteral",
																"src": "3469:1:1",
																"type": "",
																"value": "8"
															},
															{
																"name": "bytes",
																"nodeType": "YulIdentifier",
																"src": "3472:5:1"
															}
														],
														"functionName": {
															"name": "mul",
															"nodeType": "YulIdentifier",
															"src": "3465:3:1"
														},
														"nodeType": "YulFunctionCall",
														"src": "3465:13:1"
													},
													{
														"arguments": [
															{
																"kind": "number",
																"nodeType": "YulLiteral",
																"src": "3484:1:1",
																"type": "",
																"value": "0"
															}
														],
														"functionName": {
															"name": "not",
															"nodeType": "YulIdentifier",
															"src": "3480:3:1"
														},
														"nodeType": "YulFunctionCall",
														"src": "3480:6:1"
													}
												],
												"functionName": {
													"name": "shift_right_unsigned_dynamic",
													"nodeType": "YulIdentifier",
													"src": "3436:28:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "3436:51:1"
											}
										],
										"functionName": {
											"name": "not",
											"nodeType": "YulIdentifier",
											"src": "3432:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3432:56:1"
									},
									"variables": [
										{
											"name": "mask",
											"nodeType": "YulTypedName",
											"src": "3424:4:1",
											"type": ""
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "3497:25:1",
									"value": {
										"arguments": [
											{
												"name": "data",
												"nodeType": "YulIdentifier",
												"src": "3511:4:1"
											},
											{
												"name": "mask",
												"nodeType": "YulIdentifier",
												"src": "3517:4:1"
											}
										],
										"functionName": {
											"name": "and",
											"nodeType": "YulIdentifier",
											"src": "3507:3:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3507:15:1"
									},
									"variableNames": [
										{
											"name": "result",
											"nodeType": "YulIdentifier",
											"src": "3497:6:1"
										}
									]
								}
							]
						},
						"name": "mask_bytes_dynamic",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "data",
								"nodeType": "YulTypedName",
								"src": "3387:4:1",
								"type": ""
							},
							{
								"name": "bytes",
								"nodeType": "YulTypedName",
								"src": "3393:5:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "result",
								"nodeType": "YulTypedName",
								"src": "3403:6:1",
								"type": ""
							}
						],
						"src": "3359:169:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "3614:214:1",
							"statements": [
								{
									"nodeType": "YulAssignment",
									"src": "3747:37:1",
									"value": {
										"arguments": [
											{
												"name": "data",
												"nodeType": "YulIdentifier",
												"src": "3774:4:1"
											},
											{
												"name": "len",
												"nodeType": "YulIdentifier",
												"src": "3780:3:1"
											}
										],
										"functionName": {
											"name": "mask_bytes_dynamic",
											"nodeType": "YulIdentifier",
											"src": "3755:18:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3755:29:1"
									},
									"variableNames": [
										{
											"name": "data",
											"nodeType": "YulIdentifier",
											"src": "3747:4:1"
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "3793:29:1",
									"value": {
										"arguments": [
											{
												"name": "data",
												"nodeType": "YulIdentifier",
												"src": "3804:4:1"
											},
											{
												"arguments": [
													{
														"kind": "number",
														"nodeType": "YulLiteral",
														"src": "3814:1:1",
														"type": "",
														"value": "2"
													},
													{
														"name": "len",
														"nodeType": "YulIdentifier",
														"src": "3817:3:1"
													}
												],
												"functionName": {
													"name": "mul",
													"nodeType": "YulIdentifier",
													"src": "3810:3:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "3810:11:1"
											}
										],
										"functionName": {
											"name": "or",
											"nodeType": "YulIdentifier",
											"src": "3801:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3801:21:1"
									},
									"variableNames": [
										{
											"name": "used",
											"nodeType": "YulIdentifier",
											"src": "3793:4:1"
										}
									]
								}
							]
						},
						"name": "extract_used_part_and_set_length_of_short_byte_array",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "data",
								"nodeType": "YulTypedName",
								"src": "3595:4:1",
								"type": ""
							},
							{
								"name": "len",
								"nodeType": "YulTypedName",
								"src": "3601:3:1",
								"type": ""
							}
						],
						"returnVariables": [
							{
								"name": "used",
								"nodeType": "YulTypedName",
								"src": "3609:4:1",
								"type": ""
							}
						],
						"src": "3533:295:1"
					},
					{
						"body": {
							"nodeType": "YulBlock",
							"src": "3925:1303:1",
							"statements": [
								{
									"nodeType": "YulVariableDeclaration",
									"src": "3936:51:1",
									"value": {
										"arguments": [
											{
												"name": "src",
												"nodeType": "YulIdentifier",
												"src": "3983:3:1"
											}
										],
										"functionName": {
											"name": "array_length_t_string_memory_ptr",
											"nodeType": "YulIdentifier",
											"src": "3950:32:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "3950:37:1"
									},
									"variables": [
										{
											"name": "newLen",
											"nodeType": "YulTypedName",
											"src": "3940:6:1",
											"type": ""
										}
									]
								},
								{
									"body": {
										"nodeType": "YulBlock",
										"src": "4072:22:1",
										"statements": [
											{
												"expression": {
													"arguments": [],
													"functionName": {
														"name": "panic_error_0x41",
														"nodeType": "YulIdentifier",
														"src": "4074:16:1"
													},
													"nodeType": "YulFunctionCall",
													"src": "4074:18:1"
												},
												"nodeType": "YulExpressionStatement",
												"src": "4074:18:1"
											}
										]
									},
									"condition": {
										"arguments": [
											{
												"name": "newLen",
												"nodeType": "YulIdentifier",
												"src": "4044:6:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "4052:18:1",
												"type": "",
												"value": "0xffffffffffffffff"
											}
										],
										"functionName": {
											"name": "gt",
											"nodeType": "YulIdentifier",
											"src": "4041:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "4041:30:1"
									},
									"nodeType": "YulIf",
									"src": "4038:56:1"
								},
								{
									"nodeType": "YulVariableDeclaration",
									"src": "4104:52:1",
									"value": {
										"arguments": [
											{
												"arguments": [
													{
														"name": "slot",
														"nodeType": "YulIdentifier",
														"src": "4150:4:1"
													}
												],
												"functionName": {
													"name": "sload",
													"nodeType": "YulIdentifier",
													"src": "4144:5:1"
												},
												"nodeType": "YulFunctionCall",
												"src": "4144:11:1"
											}
										],
										"functionName": {
											"name": "extract_byte_array_length",
											"nodeType": "YulIdentifier",
											"src": "4118:25:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "4118:38:1"
									},
									"variables": [
										{
											"name": "oldLen",
											"nodeType": "YulTypedName",
											"src": "4108:6:1",
											"type": ""
										}
									]
								},
								{
									"expression": {
										"arguments": [
											{
												"name": "slot",
												"nodeType": "YulIdentifier",
												"src": "4249:4:1"
											},
											{
												"name": "oldLen",
												"nodeType": "YulIdentifier",
												"src": "4255:6:1"
											},
											{
												"name": "newLen",
												"nodeType": "YulIdentifier",
												"src": "4263:6:1"
											}
										],
										"functionName": {
											"name": "clean_up_bytearray_end_slots_t_string_storage",
											"nodeType": "YulIdentifier",
											"src": "4203:45:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "4203:67:1"
									},
									"nodeType": "YulExpressionStatement",
									"src": "4203:67:1"
								},
								{
									"nodeType": "YulVariableDeclaration",
									"src": "4280:18:1",
									"value": {
										"kind": "number",
										"nodeType": "YulLiteral",
										"src": "4297:1:1",
										"type": "",
										"value": "0"
									},
									"variables": [
										{
											"name": "srcOffset",
											"nodeType": "YulTypedName",
											"src": "4284:9:1",
											"type": ""
										}
									]
								},
								{
									"nodeType": "YulAssignment",
									"src": "4308:17:1",
									"value": {
										"kind": "number",
										"nodeType": "YulLiteral",
										"src": "4321:4:1",
										"type": "",
										"value": "0x20"
									},
									"variableNames": [
										{
											"name": "srcOffset",
											"nodeType": "YulIdentifier",
											"src": "4308:9:1"
										}
									]
								},
								{
									"cases": [
										{
											"body": {
												"nodeType": "YulBlock",
												"src": "4372:611:1",
												"statements": [
													{
														"nodeType": "YulVariableDeclaration",
														"src": "4386:37:1",
														"value": {
															"arguments": [
																{
																	"name": "newLen",
																	"nodeType": "YulIdentifier",
																	"src": "4405:6:1"
																},
																{
																	"arguments": [
																		{
																			"kind": "number",
																			"nodeType": "YulLiteral",
																			"src": "4417:4:1",
																			"type": "",
																			"value": "0x1f"
																		}
																	],
																	"functionName": {
																		"name": "not",
																		"nodeType": "YulIdentifier",
																		"src": "4413:3:1"
																	},
																	"nodeType": "YulFunctionCall",
																	"src": "4413:9:1"
																}
															],
															"functionName": {
																"name": "and",
																"nodeType": "YulIdentifier",
																"src": "4401:3:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "4401:22:1"
														},
														"variables": [
															{
																"name": "loopEnd",
																"nodeType": "YulTypedName",
																"src": "4390:7:1",
																"type": ""
															}
														]
													},
													{
														"nodeType": "YulVariableDeclaration",
														"src": "4437:51:1",
														"value": {
															"arguments": [
																{
																	"name": "slot",
																	"nodeType": "YulIdentifier",
																	"src": "4483:4:1"
																}
															],
															"functionName": {
																"name": "array_dataslot_t_string_storage",
																"nodeType": "YulIdentifier",
																"src": "4451:31:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "4451:37:1"
														},
														"variables": [
															{
																"name": "dstPtr",
																"nodeType": "YulTypedName",
																"src": "4441:6:1",
																"type": ""
															}
														]
													},
													{
														"nodeType": "YulVariableDeclaration",
														"src": "4501:10:1",
														"value": {
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "4510:1:1",
															"type": "",
															"value": "0"
														},
														"variables": [
															{
																"name": "i",
																"nodeType": "YulTypedName",
																"src": "4505:1:1",
																"type": ""
															}
														]
													},
													{
														"body": {
															"nodeType": "YulBlock",
															"src": "4569:163:1",
															"statements": [
																{
																	"expression": {
																		"arguments": [
																			{
																				"name": "dstPtr",
																				"nodeType": "YulIdentifier",
																				"src": "4594:6:1"
																			},
																			{
																				"arguments": [
																					{
																						"arguments": [
																							{
																								"name": "src",
																								"nodeType": "YulIdentifier",
																								"src": "4612:3:1"
																							},
																							{
																								"name": "srcOffset",
																								"nodeType": "YulIdentifier",
																								"src": "4617:9:1"
																							}
																						],
																						"functionName": {
																							"name": "add",
																							"nodeType": "YulIdentifier",
																							"src": "4608:3:1"
																						},
																						"nodeType": "YulFunctionCall",
																						"src": "4608:19:1"
																					}
																				],
																				"functionName": {
																					"name": "mload",
																					"nodeType": "YulIdentifier",
																					"src": "4602:5:1"
																				},
																				"nodeType": "YulFunctionCall",
																				"src": "4602:26:1"
																			}
																		],
																		"functionName": {
																			"name": "sstore",
																			"nodeType": "YulIdentifier",
																			"src": "4587:6:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4587:42:1"
																	},
																	"nodeType": "YulExpressionStatement",
																	"src": "4587:42:1"
																},
																{
																	"nodeType": "YulAssignment",
																	"src": "4646:24:1",
																	"value": {
																		"arguments": [
																			{
																				"name": "dstPtr",
																				"nodeType": "YulIdentifier",
																				"src": "4660:6:1"
																			},
																			{
																				"kind": "number",
																				"nodeType": "YulLiteral",
																				"src": "4668:1:1",
																				"type": "",
																				"value": "1"
																			}
																		],
																		"functionName": {
																			"name": "add",
																			"nodeType": "YulIdentifier",
																			"src": "4656:3:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4656:14:1"
																	},
																	"variableNames": [
																		{
																			"name": "dstPtr",
																			"nodeType": "YulIdentifier",
																			"src": "4646:6:1"
																		}
																	]
																},
																{
																	"nodeType": "YulAssignment",
																	"src": "4687:31:1",
																	"value": {
																		"arguments": [
																			{
																				"name": "srcOffset",
																				"nodeType": "YulIdentifier",
																				"src": "4704:9:1"
																			},
																			{
																				"kind": "number",
																				"nodeType": "YulLiteral",
																				"src": "4715:2:1",
																				"type": "",
																				"value": "32"
																			}
																		],
																		"functionName": {
																			"name": "add",
																			"nodeType": "YulIdentifier",
																			"src": "4700:3:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4700:18:1"
																	},
																	"variableNames": [
																		{
																			"name": "srcOffset",
																			"nodeType": "YulIdentifier",
																			"src": "4687:9:1"
																		}
																	]
																}
															]
														},
														"condition": {
															"arguments": [
																{
																	"name": "i",
																	"nodeType": "YulIdentifier",
																	"src": "4535:1:1"
																},
																{
																	"name": "loopEnd",
																	"nodeType": "YulIdentifier",
																	"src": "4538:7:1"
																}
															],
															"functionName": {
																"name": "lt",
																"nodeType": "YulIdentifier",
																"src": "4532:2:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "4532:14:1"
														},
														"nodeType": "YulForLoop",
														"post": {
															"nodeType": "YulBlock",
															"src": "4547:21:1",
															"statements": [
																{
																	"nodeType": "YulAssignment",
																	"src": "4549:17:1",
																	"value": {
																		"arguments": [
																			{
																				"name": "i",
																				"nodeType": "YulIdentifier",
																				"src": "4558:1:1"
																			},
																			{
																				"kind": "number",
																				"nodeType": "YulLiteral",
																				"src": "4561:4:1",
																				"type": "",
																				"value": "0x20"
																			}
																		],
																		"functionName": {
																			"name": "add",
																			"nodeType": "YulIdentifier",
																			"src": "4554:3:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4554:12:1"
																	},
																	"variableNames": [
																		{
																			"name": "i",
																			"nodeType": "YulIdentifier",
																			"src": "4549:1:1"
																		}
																	]
																}
															]
														},
														"pre": {
															"nodeType": "YulBlock",
															"src": "4528:3:1",
															"statements": []
														},
														"src": "4524:208:1"
													},
													{
														"body": {
															"nodeType": "YulBlock",
															"src": "4768:156:1",
															"statements": [
																{
																	"nodeType": "YulVariableDeclaration",
																	"src": "4786:43:1",
																	"value": {
																		"arguments": [
																			{
																				"arguments": [
																					{
																						"name": "src",
																						"nodeType": "YulIdentifier",
																						"src": "4813:3:1"
																					},
																					{
																						"name": "srcOffset",
																						"nodeType": "YulIdentifier",
																						"src": "4818:9:1"
																					}
																				],
																				"functionName": {
																					"name": "add",
																					"nodeType": "YulIdentifier",
																					"src": "4809:3:1"
																				},
																				"nodeType": "YulFunctionCall",
																				"src": "4809:19:1"
																			}
																		],
																		"functionName": {
																			"name": "mload",
																			"nodeType": "YulIdentifier",
																			"src": "4803:5:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4803:26:1"
																	},
																	"variables": [
																		{
																			"name": "lastValue",
																			"nodeType": "YulTypedName",
																			"src": "4790:9:1",
																			"type": ""
																		}
																	]
																},
																{
																	"expression": {
																		"arguments": [
																			{
																				"name": "dstPtr",
																				"nodeType": "YulIdentifier",
																				"src": "4853:6:1"
																			},
																			{
																				"arguments": [
																					{
																						"name": "lastValue",
																						"nodeType": "YulIdentifier",
																						"src": "4880:9:1"
																					},
																					{
																						"arguments": [
																							{
																								"name": "newLen",
																								"nodeType": "YulIdentifier",
																								"src": "4895:6:1"
																							},
																							{
																								"kind": "number",
																								"nodeType": "YulLiteral",
																								"src": "4903:4:1",
																								"type": "",
																								"value": "0x1f"
																							}
																						],
																						"functionName": {
																							"name": "and",
																							"nodeType": "YulIdentifier",
																							"src": "4891:3:1"
																						},
																						"nodeType": "YulFunctionCall",
																						"src": "4891:17:1"
																					}
																				],
																				"functionName": {
																					"name": "mask_bytes_dynamic",
																					"nodeType": "YulIdentifier",
																					"src": "4861:18:1"
																				},
																				"nodeType": "YulFunctionCall",
																				"src": "4861:48:1"
																			}
																		],
																		"functionName": {
																			"name": "sstore",
																			"nodeType": "YulIdentifier",
																			"src": "4846:6:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "4846:64:1"
																	},
																	"nodeType": "YulExpressionStatement",
																	"src": "4846:64:1"
																}
															]
														},
														"condition": {
															"arguments": [
																{
																	"name": "loopEnd",
																	"nodeType": "YulIdentifier",
																	"src": "4751:7:1"
																},
																{
																	"name": "newLen",
																	"nodeType": "YulIdentifier",
																	"src": "4760:6:1"
																}
															],
															"functionName": {
																"name": "lt",
																"nodeType": "YulIdentifier",
																"src": "4748:2:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "4748:19:1"
														},
														"nodeType": "YulIf",
														"src": "4745:179:1"
													},
													{
														"expression": {
															"arguments": [
																{
																	"name": "slot",
																	"nodeType": "YulIdentifier",
																	"src": "4944:4:1"
																},
																{
																	"arguments": [
																		{
																			"arguments": [
																				{
																					"name": "newLen",
																					"nodeType": "YulIdentifier",
																					"src": "4958:6:1"
																				},
																				{
																					"kind": "number",
																					"nodeType": "YulLiteral",
																					"src": "4966:1:1",
																					"type": "",
																					"value": "2"
																				}
																			],
																			"functionName": {
																				"name": "mul",
																				"nodeType": "YulIdentifier",
																				"src": "4954:3:1"
																			},
																			"nodeType": "YulFunctionCall",
																			"src": "4954:14:1"
																		},
																		{
																			"kind": "number",
																			"nodeType": "YulLiteral",
																			"src": "4970:1:1",
																			"type": "",
																			"value": "1"
																		}
																	],
																	"functionName": {
																		"name": "add",
																		"nodeType": "YulIdentifier",
																		"src": "4950:3:1"
																	},
																	"nodeType": "YulFunctionCall",
																	"src": "4950:22:1"
																}
															],
															"functionName": {
																"name": "sstore",
																"nodeType": "YulIdentifier",
																"src": "4937:6:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "4937:36:1"
														},
														"nodeType": "YulExpressionStatement",
														"src": "4937:36:1"
													}
												]
											},
											"nodeType": "YulCase",
											"src": "4365:618:1",
											"value": {
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "4370:1:1",
												"type": "",
												"value": "1"
											}
										},
										{
											"body": {
												"nodeType": "YulBlock",
												"src": "5000:222:1",
												"statements": [
													{
														"nodeType": "YulVariableDeclaration",
														"src": "5014:14:1",
														"value": {
															"kind": "number",
															"nodeType": "YulLiteral",
															"src": "5027:1:1",
															"type": "",
															"value": "0"
														},
														"variables": [
															{
																"name": "value",
																"nodeType": "YulTypedName",
																"src": "5018:5:1",
																"type": ""
															}
														]
													},
													{
														"body": {
															"nodeType": "YulBlock",
															"src": "5051:67:1",
															"statements": [
																{
																	"nodeType": "YulAssignment",
																	"src": "5069:35:1",
																	"value": {
																		"arguments": [
																			{
																				"arguments": [
																					{
																						"name": "src",
																						"nodeType": "YulIdentifier",
																						"src": "5088:3:1"
																					},
																					{
																						"name": "srcOffset",
																						"nodeType": "YulIdentifier",
																						"src": "5093:9:1"
																					}
																				],
																				"functionName": {
																					"name": "add",
																					"nodeType": "YulIdentifier",
																					"src": "5084:3:1"
																				},
																				"nodeType": "YulFunctionCall",
																				"src": "5084:19:1"
																			}
																		],
																		"functionName": {
																			"name": "mload",
																			"nodeType": "YulIdentifier",
																			"src": "5078:5:1"
																		},
																		"nodeType": "YulFunctionCall",
																		"src": "5078:26:1"
																	},
																	"variableNames": [
																		{
																			"name": "value",
																			"nodeType": "YulIdentifier",
																			"src": "5069:5:1"
																		}
																	]
																}
															]
														},
														"condition": {
															"name": "newLen",
															"nodeType": "YulIdentifier",
															"src": "5044:6:1"
														},
														"nodeType": "YulIf",
														"src": "5041:77:1"
													},
													{
														"expression": {
															"arguments": [
																{
																	"name": "slot",
																	"nodeType": "YulIdentifier",
																	"src": "5138:4:1"
																},
																{
																	"arguments": [
																		{
																			"name": "value",
																			"nodeType": "YulIdentifier",
																			"src": "5197:5:1"
																		},
																		{
																			"name": "newLen",
																			"nodeType": "YulIdentifier",
																			"src": "5204:6:1"
																		}
																	],
																	"functionName": {
																		"name": "extract_used_part_and_set_length_of_short_byte_array",
																		"nodeType": "YulIdentifier",
																		"src": "5144:52:1"
																	},
																	"nodeType": "YulFunctionCall",
																	"src": "5144:67:1"
																}
															],
															"functionName": {
																"name": "sstore",
																"nodeType": "YulIdentifier",
																"src": "5131:6:1"
															},
															"nodeType": "YulFunctionCall",
															"src": "5131:81:1"
														},
														"nodeType": "YulExpressionStatement",
														"src": "5131:81:1"
													}
												]
											},
											"nodeType": "YulCase",
											"src": "4992:230:1",
											"value": "default"
										}
									],
									"expression": {
										"arguments": [
											{
												"name": "newLen",
												"nodeType": "YulIdentifier",
												"src": "4345:6:1"
											},
											{
												"kind": "number",
												"nodeType": "YulLiteral",
												"src": "4353:2:1",
												"type": "",
												"value": "31"
											}
										],
										"functionName": {
											"name": "gt",
											"nodeType": "YulIdentifier",
											"src": "4342:2:1"
										},
										"nodeType": "YulFunctionCall",
										"src": "4342:14:1"
									},
									"nodeType": "YulSwitch",
									"src": "4335:887:1"
								}
							]
						},
						"name": "copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage",
						"nodeType": "YulFunctionDefinition",
						"parameters": [
							{
								"name": "slot",
								"nodeType": "YulTypedName",
								"src": "3914:4:1",
								"type": ""
							},
							{
								"name": "src",
								"nodeType": "YulTypedName",
								"src": "3920:3:1",
								"type": ""
							}
						],
						"src": "3833:1395:1"
					}
				]
			},
			"contents": "{\n\n    function array_length_t_string_memory_ptr(value) -> length {\n\n        length := mload(value)\n\n    }\n\n    function panic_error_0x41() {\n        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)\n        mstore(4, 0x41)\n        revert(0, 0x24)\n    }\n\n    function panic_error_0x22() {\n        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)\n        mstore(4, 0x22)\n        revert(0, 0x24)\n    }\n\n    function extract_byte_array_length(data) -> length {\n        length := div(data, 2)\n        let outOfPlaceEncoding := and(data, 1)\n        if iszero(outOfPlaceEncoding) {\n            length := and(length, 0x7f)\n        }\n\n        if eq(outOfPlaceEncoding, lt(length, 32)) {\n            panic_error_0x22()\n        }\n    }\n\n    function array_dataslot_t_string_storage(ptr) -> data {\n        data := ptr\n\n        mstore(0, ptr)\n        data := keccak256(0, 0x20)\n\n    }\n\n    function divide_by_32_ceil(value) -> result {\n        result := div(add(value, 31), 32)\n    }\n\n    function shift_left_dynamic(bits, value) -> newValue {\n        newValue :=\n\n        shl(bits, value)\n\n    }\n\n    function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {\n        let shiftBits := mul(shiftBytes, 8)\n        let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)\n        toInsert := shift_left_dynamic(shiftBits, toInsert)\n        value := and(value, not(mask))\n        result := or(value, and(toInsert, mask))\n    }\n\n    function cleanup_t_uint256(value) -> cleaned {\n        cleaned := value\n    }\n\n    function identity(value) -> ret {\n        ret := value\n    }\n\n    function convert_t_uint256_to_t_uint256(value) -> converted {\n        converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))\n    }\n\n    function prepare_store_t_uint256(value) -> ret {\n        ret := value\n    }\n\n    function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {\n        let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)\n        sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))\n    }\n\n    function zero_value_for_split_t_uint256() -> ret {\n        ret := 0\n    }\n\n    function storage_set_to_zero_t_uint256(slot, offset) {\n        let zero_0 := zero_value_for_split_t_uint256()\n        update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_0)\n    }\n\n    function clear_storage_range_t_bytes1(start, end) {\n        for {} lt(start, end) { start := add(start, 1) }\n        {\n            storage_set_to_zero_t_uint256(start, 0)\n        }\n    }\n\n    function clean_up_bytearray_end_slots_t_string_storage(array, len, startIndex) {\n\n        if gt(len, 31) {\n            let dataArea := array_dataslot_t_string_storage(array)\n            let deleteStart := add(dataArea, divide_by_32_ceil(startIndex))\n            // If we are clearing array to be short byte array, we want to clear only data starting from array data area.\n            if lt(startIndex, 32) { deleteStart := dataArea }\n            clear_storage_range_t_bytes1(deleteStart, add(dataArea, divide_by_32_ceil(len)))\n        }\n\n    }\n\n    function shift_right_unsigned_dynamic(bits, value) -> newValue {\n        newValue :=\n\n        shr(bits, value)\n\n    }\n\n    function mask_bytes_dynamic(data, bytes) -> result {\n        let mask := not(shift_right_unsigned_dynamic(mul(8, bytes), not(0)))\n        result := and(data, mask)\n    }\n    function extract_used_part_and_set_length_of_short_byte_array(data, len) -> used {\n        // we want to save only elements that are part of the array after resizing\n        // others should be set to zero\n        data := mask_bytes_dynamic(data, len)\n        used := or(data, mul(2, len))\n    }\n    function copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage(slot, src) {\n\n        let newLen := array_length_t_string_memory_ptr(src)\n        // Make sure array length is sane\n        if gt(newLen, 0xffffffffffffffff) { panic_error_0x41() }\n\n        let oldLen := extract_byte_array_length(sload(slot))\n\n        // potentially truncate data\n        clean_up_bytearray_end_slots_t_string_storage(slot, oldLen, newLen)\n\n        let srcOffset := 0\n\n        srcOffset := 0x20\n\n        switch gt(newLen, 31)\n        case 1 {\n            let loopEnd := and(newLen, not(0x1f))\n\n            let dstPtr := array_dataslot_t_string_storage(slot)\n            let i := 0\n            for { } lt(i, loopEnd) { i := add(i, 0x20) } {\n                sstore(dstPtr, mload(add(src, srcOffset)))\n                dstPtr := add(dstPtr, 1)\n                srcOffset := add(srcOffset, 32)\n            }\n            if lt(loopEnd, newLen) {\n                let lastValue := mload(add(src, srcOffset))\n                sstore(dstPtr, mask_bytes_dynamic(lastValue, and(newLen, 0x1f)))\n            }\n            sstore(slot, add(mul(newLen, 2), 1))\n        }\n        default {\n            let value := 0\n            if newLen {\n                value := mload(add(src, srcOffset))\n            }\n            sstore(slot, extract_used_part_and_set_length_of_short_byte_array(value, newLen))\n        }\n    }\n\n}\n",
			"id": 1,
			"language": "Yul",
			"name": "#utility.yul"
		}
	],
	"linkReferences": {},
	"object": "608060405234801561001057600080fd5b506040518060400160405280600c81526020017f48656c6c6f20576f726c642100000000000000000000000000000000000000008152506000908161005591906102ab565b5061037d565b600081519050919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b600060028204905060018216806100dc57607f821691505b6020821081036100ef576100ee610095565b5b50919050565b60008190508160005260206000209050919050565b60006020601f8301049050919050565b600082821b905092915050565b6000600883026101577fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8261011a565b610161868361011a565b95508019841693508086168417925050509392505050565b6000819050919050565b6000819050919050565b60006101a86101a361019e84610179565b610183565b610179565b9050919050565b6000819050919050565b6101c28361018d565b6101d66101ce826101af565b848454610127565b825550505050565b600090565b6101eb6101de565b6101f68184846101b9565b505050565b5b8181101561021a5761020f6000826101e3565b6001810190506101fc565b5050565b601f82111561025f57610230816100f5565b6102398461010a565b81016020851015610248578190505b61025c6102548561010a565b8301826101fb565b50505b505050565b600082821c905092915050565b600061028260001984600802610264565b1980831691505092915050565b600061029b8383610271565b9150826002028217905092915050565b6102b48261005b565b67ffffffffffffffff8111156102cd576102cc610066565b5b6102d782546100c4565b6102e282828561021e565b600060209050601f8311600181146103155760008415610303578287015190505b61030d858261028f565b865550610375565b601f198416610323866100f5565b60005b8281101561034b57848901518255600182019150602085019450602081019050610326565b868310156103685784890151610364601f891682610271565b8355505b6001600288020188555050505b505050505050565b61022d8061038c6000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c8063c660ab0e14610030575b600080fd5b61003861004e565b6040516100459190610175565b60405180910390f35b6000805461005b906101c6565b80601f0160208091040260200160405190810160405280929190818152602001828054610087906101c6565b80156100d45780601f106100a9576101008083540402835291602001916100d4565b820191906000526020600020905b8154815290600101906020018083116100b757829003601f168201915b505050505081565b600081519050919050565b600082825260208201905092915050565b60005b838110156101165780820151818401526020810190506100fb565b83811115610125576000848401525b50505050565b6000601f19601f8301169050919050565b6000610147826100dc565b61015181856100e7565b93506101618185602086016100f8565b61016a8161012b565b840191505092915050565b6000602082019050818103600083015261018f818461013c565b905092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b600060028204905060018216806101de57607f821691505b6020821081036101f1576101f0610197565b5b5091905056fea2646970667358221220ead70d6078537cd963215bfa8d2fc31f87c3287f5aca564321c35436370483c264736f6c634300080f0033",
	"opcodes": "PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH2 0x10 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH1 0x40 MLOAD DUP1 PUSH1 0x40 ADD PUSH1 0x40 MSTORE DUP1 PUSH1 0xC DUP2 MSTORE PUSH1 0x20 ADD PUSH32 0x48656C6C6F20576F726C64210000000000000000000000000000000000000000 DUP2 MSTORE POP PUSH1 0x0 SWAP1 DUP2 PUSH2 0x55 SWAP2 SWAP1 PUSH2 0x2AB JUMP JUMPDEST POP PUSH2 0x37D JUMP JUMPDEST PUSH1 0x0 DUP2 MLOAD SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH32 0x4E487B7100000000000000000000000000000000000000000000000000000000 PUSH1 0x0 MSTORE PUSH1 0x41 PUSH1 0x4 MSTORE PUSH1 0x24 PUSH1 0x0 REVERT JUMPDEST PUSH32 0x4E487B7100000000000000000000000000000000000000000000000000000000 PUSH1 0x0 MSTORE PUSH1 0x22 PUSH1 0x4 MSTORE PUSH1 0x24 PUSH1 0x0 REVERT JUMPDEST PUSH1 0x0 PUSH1 0x2 DUP3 DIV SWAP1 POP PUSH1 0x1 DUP3 AND DUP1 PUSH2 0xDC JUMPI PUSH1 0x7F DUP3 AND SWAP2 POP JUMPDEST PUSH1 0x20 DUP3 LT DUP2 SUB PUSH2 0xEF JUMPI PUSH2 0xEE PUSH2 0x95 JUMP JUMPDEST JUMPDEST POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 DUP2 SWAP1 POP DUP2 PUSH1 0x0 MSTORE PUSH1 0x20 PUSH1 0x0 KECCAK256 SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 PUSH1 0x20 PUSH1 0x1F DUP4 ADD DIV SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 DUP3 DUP3 SHL SWAP1 POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 PUSH1 0x8 DUP4 MUL PUSH2 0x157 PUSH32 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF DUP3 PUSH2 0x11A JUMP JUMPDEST PUSH2 0x161 DUP7 DUP4 PUSH2 0x11A JUMP JUMPDEST SWAP6 POP DUP1 NOT DUP5 AND SWAP4 POP DUP1 DUP7 AND DUP5 OR SWAP3 POP POP POP SWAP4 SWAP3 POP POP POP JUMP JUMPDEST PUSH1 0x0 DUP2 SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 DUP2 SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 PUSH2 0x1A8 PUSH2 0x1A3 PUSH2 0x19E DUP5 PUSH2 0x179 JUMP JUMPDEST PUSH2 0x183 JUMP JUMPDEST PUSH2 0x179 JUMP JUMPDEST SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 DUP2 SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH2 0x1C2 DUP4 PUSH2 0x18D JUMP JUMPDEST PUSH2 0x1D6 PUSH2 0x1CE DUP3 PUSH2 0x1AF JUMP JUMPDEST DUP5 DUP5 SLOAD PUSH2 0x127 JUMP JUMPDEST DUP3 SSTORE POP POP POP POP JUMP JUMPDEST PUSH1 0x0 SWAP1 JUMP JUMPDEST PUSH2 0x1EB PUSH2 0x1DE JUMP JUMPDEST PUSH2 0x1F6 DUP2 DUP5 DUP5 PUSH2 0x1B9 JUMP JUMPDEST POP POP POP JUMP JUMPDEST JUMPDEST DUP2 DUP2 LT ISZERO PUSH2 0x21A JUMPI PUSH2 0x20F PUSH1 0x0 DUP3 PUSH2 0x1E3 JUMP JUMPDEST PUSH1 0x1 DUP2 ADD SWAP1 POP PUSH2 0x1FC JUMP JUMPDEST POP POP JUMP JUMPDEST PUSH1 0x1F DUP3 GT ISZERO PUSH2 0x25F JUMPI PUSH2 0x230 DUP2 PUSH2 0xF5 JUMP JUMPDEST PUSH2 0x239 DUP5 PUSH2 0x10A JUMP JUMPDEST DUP2 ADD PUSH1 0x20 DUP6 LT ISZERO PUSH2 0x248 JUMPI DUP2 SWAP1 POP JUMPDEST PUSH2 0x25C PUSH2 0x254 DUP6 PUSH2 0x10A JUMP JUMPDEST DUP4 ADD DUP3 PUSH2 0x1FB JUMP JUMPDEST POP POP JUMPDEST POP POP POP JUMP JUMPDEST PUSH1 0x0 DUP3 DUP3 SHR SWAP1 POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 PUSH2 0x282 PUSH1 0x0 NOT DUP5 PUSH1 0x8 MUL PUSH2 0x264 JUMP JUMPDEST NOT DUP1 DUP4 AND SWAP2 POP POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 PUSH2 0x29B DUP4 DUP4 PUSH2 0x271 JUMP JUMPDEST SWAP2 POP DUP3 PUSH1 0x2 MUL DUP3 OR SWAP1 POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH2 0x2B4 DUP3 PUSH2 0x5B JUMP JUMPDEST PUSH8 0xFFFFFFFFFFFFFFFF DUP2 GT ISZERO PUSH2 0x2CD JUMPI PUSH2 0x2CC PUSH2 0x66 JUMP JUMPDEST JUMPDEST PUSH2 0x2D7 DUP3 SLOAD PUSH2 0xC4 JUMP JUMPDEST PUSH2 0x2E2 DUP3 DUP3 DUP6 PUSH2 0x21E JUMP JUMPDEST PUSH1 0x0 PUSH1 0x20 SWAP1 POP PUSH1 0x1F DUP4 GT PUSH1 0x1 DUP2 EQ PUSH2 0x315 JUMPI PUSH1 0x0 DUP5 ISZERO PUSH2 0x303 JUMPI DUP3 DUP8 ADD MLOAD SWAP1 POP JUMPDEST PUSH2 0x30D DUP6 DUP3 PUSH2 0x28F JUMP JUMPDEST DUP7 SSTORE POP PUSH2 0x375 JUMP JUMPDEST PUSH1 0x1F NOT DUP5 AND PUSH2 0x323 DUP7 PUSH2 0xF5 JUMP JUMPDEST PUSH1 0x0 JUMPDEST DUP3 DUP2 LT ISZERO PUSH2 0x34B JUMPI DUP5 DUP10 ADD MLOAD DUP3 SSTORE PUSH1 0x1 DUP3 ADD SWAP2 POP PUSH1 0x20 DUP6 ADD SWAP5 POP PUSH1 0x20 DUP2 ADD SWAP1 POP PUSH2 0x326 JUMP JUMPDEST DUP7 DUP4 LT ISZERO PUSH2 0x368 JUMPI DUP5 DUP10 ADD MLOAD PUSH2 0x364 PUSH1 0x1F DUP10 AND DUP3 PUSH2 0x271 JUMP JUMPDEST DUP4 SSTORE POP JUMPDEST PUSH1 0x1 PUSH1 0x2 DUP9 MUL ADD DUP9 SSTORE POP POP POP JUMPDEST POP POP POP POP POP POP JUMP JUMPDEST PUSH2 0x22D DUP1 PUSH2 0x38C PUSH1 0x0 CODECOPY PUSH1 0x0 RETURN INVALID PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH2 0x10 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH1 0x4 CALLDATASIZE LT PUSH2 0x2B JUMPI PUSH1 0x0 CALLDATALOAD PUSH1 0xE0 SHR DUP1 PUSH4 0xC660AB0E EQ PUSH2 0x30 JUMPI JUMPDEST PUSH1 0x0 DUP1 REVERT JUMPDEST PUSH2 0x38 PUSH2 0x4E JUMP JUMPDEST PUSH1 0x40 MLOAD PUSH2 0x45 SWAP2 SWAP1 PUSH2 0x175 JUMP JUMPDEST PUSH1 0x40 MLOAD DUP1 SWAP2 SUB SWAP1 RETURN JUMPDEST PUSH1 0x0 DUP1 SLOAD PUSH2 0x5B SWAP1 PUSH2 0x1C6 JUMP JUMPDEST DUP1 PUSH1 0x1F ADD PUSH1 0x20 DUP1 SWAP2 DIV MUL PUSH1 0x20 ADD PUSH1 0x40 MLOAD SWAP1 DUP2 ADD PUSH1 0x40 MSTORE DUP1 SWAP3 SWAP2 SWAP1 DUP2 DUP2 MSTORE PUSH1 0x20 ADD DUP3 DUP1 SLOAD PUSH2 0x87 SWAP1 PUSH2 0x1C6 JUMP JUMPDEST DUP1 ISZERO PUSH2 0xD4 JUMPI DUP1 PUSH1 0x1F LT PUSH2 0xA9 JUMPI PUSH2 0x100 DUP1 DUP4 SLOAD DIV MUL DUP4 MSTORE SWAP2 PUSH1 0x20 ADD SWAP2 PUSH2 0xD4 JUMP JUMPDEST DUP3 ADD SWAP2 SWAP1 PUSH1 0x0 MSTORE PUSH1 0x20 PUSH1 0x0 KECCAK256 SWAP1 JUMPDEST DUP2 SLOAD DUP2 MSTORE SWAP1 PUSH1 0x1 ADD SWAP1 PUSH1 0x20 ADD DUP1 DUP4 GT PUSH2 0xB7 JUMPI DUP3 SWAP1 SUB PUSH1 0x1F AND DUP3 ADD SWAP2 JUMPDEST POP POP POP POP POP DUP2 JUMP JUMPDEST PUSH1 0x0 DUP2 MLOAD SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 DUP3 DUP3 MSTORE PUSH1 0x20 DUP3 ADD SWAP1 POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 JUMPDEST DUP4 DUP2 LT ISZERO PUSH2 0x116 JUMPI DUP1 DUP3 ADD MLOAD DUP2 DUP5 ADD MSTORE PUSH1 0x20 DUP2 ADD SWAP1 POP PUSH2 0xFB JUMP JUMPDEST DUP4 DUP2 GT ISZERO PUSH2 0x125 JUMPI PUSH1 0x0 DUP5 DUP5 ADD MSTORE JUMPDEST POP POP POP POP JUMP JUMPDEST PUSH1 0x0 PUSH1 0x1F NOT PUSH1 0x1F DUP4 ADD AND SWAP1 POP SWAP2 SWAP1 POP JUMP JUMPDEST PUSH1 0x0 PUSH2 0x147 DUP3 PUSH2 0xDC JUMP JUMPDEST PUSH2 0x151 DUP2 DUP6 PUSH2 0xE7 JUMP JUMPDEST SWAP4 POP PUSH2 0x161 DUP2 DUP6 PUSH1 0x20 DUP7 ADD PUSH2 0xF8 JUMP JUMPDEST PUSH2 0x16A DUP2 PUSH2 0x12B JUMP JUMPDEST DUP5 ADD SWAP2 POP POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 PUSH1 0x20 DUP3 ADD SWAP1 POP DUP2 DUP2 SUB PUSH1 0x0 DUP4 ADD MSTORE PUSH2 0x18F DUP2 DUP5 PUSH2 0x13C JUMP JUMPDEST SWAP1 POP SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH32 0x4E487B7100000000000000000000000000000000000000000000000000000000 PUSH1 0x0 MSTORE PUSH1 0x22 PUSH1 0x4 MSTORE PUSH1 0x24 PUSH1 0x0 REVERT JUMPDEST PUSH1 0x0 PUSH1 0x2 DUP3 DIV SWAP1 POP PUSH1 0x1 DUP3 AND DUP1 PUSH2 0x1DE JUMPI PUSH1 0x7F DUP3 AND SWAP2 POP JUMPDEST PUSH1 0x20 DUP3 LT DUP2 SUB PUSH2 0x1F1 JUMPI PUSH2 0x1F0 PUSH2 0x197 JUMP JUMPDEST JUMPDEST POP SWAP2 SWAP1 POP JUMP INVALID LOG2 PUSH5 0x6970667358 0x22 SLT KECCAK256 0xEA 0xD7 0xD PUSH1 0x78 MSTORE8 PUSH29 0xD963215BFA8D2FC31F87C3287F5ACA564321C35436370483C264736F6C PUSH4 0x4300080F STOP CALLER ",
	"sourceMap": "129:889:0:-:0;;;542:405;;;;;;;;;;914:25;;;;;;;;;;;;;;;;;:8;:25;;;;;;:::i;:::-;;129:889;;7:99:1;59:6;93:5;87:12;77:22;;7:99;;;:::o;112:180::-;160:77;157:1;150:88;257:4;254:1;247:15;281:4;278:1;271:15;298:180;346:77;343:1;336:88;443:4;440:1;433:15;467:4;464:1;457:15;484:320;528:6;565:1;559:4;555:12;545:22;;612:1;606:4;602:12;633:18;623:81;;689:4;681:6;677:17;667:27;;623:81;751:2;743:6;740:14;720:18;717:38;714:84;;770:18;;:::i;:::-;714:84;535:269;484:320;;;:::o;810:141::-;859:4;882:3;874:11;;905:3;902:1;895:14;939:4;936:1;926:18;918:26;;810:141;;;:::o;957:93::-;994:6;1041:2;1036;1029:5;1025:14;1021:23;1011:33;;957:93;;;:::o;1056:107::-;1100:8;1150:5;1144:4;1140:16;1119:37;;1056:107;;;;:::o;1169:393::-;1238:6;1288:1;1276:10;1272:18;1311:97;1341:66;1330:9;1311:97;:::i;:::-;1429:39;1459:8;1448:9;1429:39;:::i;:::-;1417:51;;1501:4;1497:9;1490:5;1486:21;1477:30;;1550:4;1540:8;1536:19;1529:5;1526:30;1516:40;;1245:317;;1169:393;;;;;:::o;1568:77::-;1605:7;1634:5;1623:16;;1568:77;;;:::o;1651:60::-;1679:3;1700:5;1693:12;;1651:60;;;:::o;1717:142::-;1767:9;1800:53;1818:34;1827:24;1845:5;1827:24;:::i;:::-;1818:34;:::i;:::-;1800:53;:::i;:::-;1787:66;;1717:142;;;:::o;1865:75::-;1908:3;1929:5;1922:12;;1865:75;;;:::o;1946:269::-;2056:39;2087:7;2056:39;:::i;:::-;2117:91;2166:41;2190:16;2166:41;:::i;:::-;2158:6;2151:4;2145:11;2117:91;:::i;:::-;2111:4;2104:105;2022:193;1946:269;;;:::o;2221:73::-;2266:3;2221:73;:::o;2300:189::-;2377:32;;:::i;:::-;2418:65;2476:6;2468;2462:4;2418:65;:::i;:::-;2353:136;2300:189;;:::o;2495:186::-;2555:120;2572:3;2565:5;2562:14;2555:120;;;2626:39;2663:1;2656:5;2626:39;:::i;:::-;2599:1;2592:5;2588:13;2579:22;;2555:120;;;2495:186;;:::o;2687:543::-;2788:2;2783:3;2780:11;2777:446;;;2822:38;2854:5;2822:38;:::i;:::-;2906:29;2924:10;2906:29;:::i;:::-;2896:8;2892:44;3089:2;3077:10;3074:18;3071:49;;;3110:8;3095:23;;3071:49;3133:80;3189:22;3207:3;3189:22;:::i;:::-;3179:8;3175:37;3162:11;3133:80;:::i;:::-;2792:431;;2777:446;2687:543;;;:::o;3236:117::-;3290:8;3340:5;3334:4;3330:16;3309:37;;3236:117;;;;:::o;3359:169::-;3403:6;3436:51;3484:1;3480:6;3472:5;3469:1;3465:13;3436:51;:::i;:::-;3432:56;3517:4;3511;3507:15;3497:25;;3410:118;3359:169;;;;:::o;3533:295::-;3609:4;3755:29;3780:3;3774:4;3755:29;:::i;:::-;3747:37;;3817:3;3814:1;3810:11;3804:4;3801:21;3793:29;;3533:295;;;;:::o;3833:1395::-;3950:37;3983:3;3950:37;:::i;:::-;4052:18;4044:6;4041:30;4038:56;;;4074:18;;:::i;:::-;4038:56;4118:38;4150:4;4144:11;4118:38;:::i;:::-;4203:67;4263:6;4255;4249:4;4203:67;:::i;:::-;4297:1;4321:4;4308:17;;4353:2;4345:6;4342:14;4370:1;4365:618;;;;5027:1;5044:6;5041:77;;;5093:9;5088:3;5084:19;5078:26;5069:35;;5041:77;5144:67;5204:6;5197:5;5144:67;:::i;:::-;5138:4;5131:81;5000:222;4335:887;;4365:618;4417:4;4413:9;4405:6;4401:22;4451:37;4483:4;4451:37;:::i;:::-;4510:1;4524:208;4538:7;4535:1;4532:14;4524:208;;;4617:9;4612:3;4608:19;4602:26;4594:6;4587:42;4668:1;4660:6;4656:14;4646:24;;4715:2;4704:9;4700:18;4687:31;;4561:4;4558:1;4554:12;4549:17;;4524:208;;;4760:6;4751:7;4748:19;4745:179;;;4818:9;4813:3;4809:19;4803:26;4861:48;4903:4;4895:6;4891:17;4880:9;4861:48;:::i;:::-;4853:6;4846:64;4768:156;4745:179;4970:1;4966;4958:6;4954:14;4950:22;4944:4;4937:36;4372:611;;;4335:887;;3925:1303;;;3833:1395;;:::o;129:889:0:-;;;;;;;"
}

*/


/*
   owner address:       0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    contract address:   0xd9145CCE52D386f254917e481eB44e9943F39138
*/