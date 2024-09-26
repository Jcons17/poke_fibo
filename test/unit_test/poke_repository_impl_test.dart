import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/domain/entity/move_expanded.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mock/mock.mocks.dart';
import 'fixtures/fixture.dart';

void main() {
  late final PokeRepositoryImpl pokeRepository;
  late final MockClient client;
  late final MockSharedPreferences sharedPreferences;

  setUpAll(
    () {
      sharedPreferences = MockSharedPreferences();
      client = MockClient();

      pokeRepository = PokeRepositoryImpl(client: client, sharedPreferences: sharedPreferences);
    },
  );

  group('PokeRepository test', () {
    test('get pokemon response ok', () async {
      final jsonParticular = fixture("test/unit_test/fixtures/get_pokemon_response_ok.json");
      final jsonGeneral = fixture("test/unit_test/fixtures/get_all_pokemon_response_ok.json");

      when(
        client.get(
          argThat(
            predicate(
              (Uri uri) => uri.toString().contains("limit"),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => http.Response(jsonGeneral, 200),
      );

      when(
        client.get(
          argThat(
            predicate(
              (Uri uri) => int.tryParse(uri.pathSegments.elementAt(uri.pathSegments.length - 2)) != null,
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => http.Response(jsonParticular, 200),
      );

      final result = await pokeRepository.getAllPokemon(limit: 5, offset: 0);

      verify(
        client.get(
          argThat(
            predicate(
              (Uri uri) => uri.toString().contains("limit"),
            ),
          ),
        ),
      ).called(1);

      verify(
        client.get(
          argThat(
            predicate(
              (Uri uri) => int.tryParse(uri.pathSegments.elementAt(uri.pathSegments.length - 2)) != null,
            ),
          ),
        ),
      ).called(5);

      expect(
        result.fold(
          (l) => null,
          (r) => r,
        ),
        isA<List<Pokemon>>(),
      );
    });

    test('get moves value response ok', () async {
      final json1 = fixture("test/unit_test/fixtures/get_move_1_response_ok.json");
      final json2 = fixture("test/unit_test/fixtures/get_move_2_response_ok.json");

      when(
        client.get(
          argThat(
            predicate(
              (Uri uri) => uri.pathSegments.contains("1"),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => http.Response(json1, 200),
      );

      when(
        client.get(
          argThat(
            predicate(
              (Uri uri) => uri.pathSegments.contains("2"),
            ),
          ),
        ),
      ).thenAnswer(
        (realInvocation) async => http.Response(json2, 200),
      );

      final result = await pokeRepository.getMoves(ids: ["1", "2"]);

      verify(
        client.get(
          argThat(
            predicate(
              (Uri uri) => uri.toString().contains("move"),
            ),
          ),
        ),
      ).called(2);

      expect(
        result.fold(
          (l) => null,
          (r) => r,
        ),
        isA<List<MoveExpanded>>(),
      );

      expect(
        result
            .fold(
              (l) => null,
              (r) => r,
            )
            ?.elementAt(0)
            .id,
        equals(1),
      );

      expect(
        result
            .fold(
              (l) => null,
              (r) => r,
            )
            ?.elementAt(1)
            .id,
        equals(2),
      );
    });

    test('get pokemon from team', () async {
      final jsonParticular = fixture("test/unit_test/fixtures/get_pokemon_response_ok.json");

      when(
        sharedPreferences.getStringList(PokeRepositoryImpl.TEAM_POKEMON_KEY),
      ).thenAnswer(
        (realInvocation) => [
          jsonParticular,
          jsonParticular,
        ],
      );

      final result = await pokeRepository.getMyTeamPokemon();

      verify(
        sharedPreferences.getStringList(PokeRepositoryImpl.TEAM_POKEMON_KEY),
      ).called(1);

      expect(
        result.fold(
          (l) => null,
          (r) => r,
        ),
        isA<List<Pokemon>>(),
      );

      expect(
        result
            .fold(
              (l) => null,
              (r) => r,
            )
            ?.length,
        equals(2),
      );
    });

    test('ensure that you cannot add more than six pokemon', () async {
      final jsonParticular = fixture("test/unit_test/fixtures/get_pokemon_response_ok.json");

      when(
        sharedPreferences.getStringList(PokeRepositoryImpl.TEAM_POKEMON_KEY),
      ).thenAnswer(
        (realInvocation) => [
          jsonParticular,
          jsonParticular,
          jsonParticular,
          jsonParticular,
          jsonParticular,
          jsonParticular,
        ],
      );

      final result = await pokeRepository.savePokemonForMyTeam(
        PokemonDto(
          abilities: [],
          baseExperience: 1,
          cries: CriesDto(),
          height: 1,
          id: 1,
          isDefault: true,
          locationAreaEncounters: "",
          moves: [],
          name: "name",
          order: 1,
          species: NameUrlDto(),
          sprites: SpritesDto(),
          stats: [],
          weight: 100,
        ),
      );

      verify(
        sharedPreferences.getStringList(PokeRepositoryImpl.TEAM_POKEMON_KEY),
      ).called(1);

      verifyNever(
        sharedPreferences.setStringList(PokeRepositoryImpl.TEAM_POKEMON_KEY, any),
      );

      expect(
        result.fold(
          (l) => l,
          (r) => null,
        ),
        isA<Exception>(),
      );
    });
  });
}
